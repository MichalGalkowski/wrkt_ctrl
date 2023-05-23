import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/app_styles.dart';
import 'package:wrkt_ctrl/models/exercise.dart';

import '../../../../app_colors.dart';
import '../../../../providers/exercises_provider.dart';

const Map<int, String> schemeItems = {
  0: 'reps',
  1: 'countdown',
  2: 'count up',
};

const List<String> categories = [
  'fullbody',
  'chest',
  'back',
  'arms',
  'abs',
  'legs',
  'shoulders'
];

class PutExercise extends ConsumerWidget {
  final Exercise? exercise;
  const PutExercise(this.exercise, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isAdd = exercise == null;
    final box = Hive.box('exercises');
    final scheme = ref.watch(exerciseTypeProvider);
    final category = ref.watch(exerciseCategoryProvider);
    final name = ref.watch(exerciseNameProvider);
    final personalBest = ref.watch(exercisePersonalBestProvider);
    TextEditingController nameController = TextEditingController(text: name);
    nameController.selection =
        TextSelection.collapsed(offset: nameController.text.length);
    TextEditingController personalBestController =
        TextEditingController(text: personalBest);
    personalBestController.selection =
        TextSelection.collapsed(offset: personalBestController.text.length);
    return Container(
      height: isAdd ? 320 : 420,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryMaterial[800],
        border: Border.all(color: AppColors.accentMaterial, width: 2),
      ),
      child: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${isAdd ? 'Add' : 'Update'} exercise',
              style: AppStyles.midHeader,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: TextField(
              maxLength: 50,
              style: const TextStyle(color: Color(AppColors.lightGrey)),
              controller: nameController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                  counterText: '',
                  hintText: 'exercise name',
                  iconColor: AppColors.accentMaterial),
              onChanged: (value) =>
                  ref.read(exerciseNameProvider.notifier).state = value,
            ),
          ),
          isAdd
              ? const SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                  child: TextField(
                    maxLength: 50,
                    style: const TextStyle(color: Color(AppColors.lightGrey)),
                    controller: personalBestController,
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                        counterText: '',
                        hintText: 'personal best',
                        iconColor: AppColors.accentMaterial),
                    onChanged: (value) => ref
                        .read(exercisePersonalBestProvider.notifier)
                        .state = value,
                  ),
                ),
          DropdownButton(
              alignment: AlignmentDirectional.center,
              value: scheme,
              dropdownColor: AppColors.accentMaterial,
              items: schemeItems.keys
                  .map((value) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: value,
                      child: Text(
                        '${schemeItems[value]}',
                        style: GoogleFonts.khand(
                            color: const Color(AppColors.lightGrey),
                            fontSize: 18),
                      )))
                  .toList(),
              onChanged: ((value) {
                ref.read(exerciseTypeProvider.notifier).state = value as int;
              })),
          DropdownButton(
              alignment: AlignmentDirectional.center,
              value: category,
              dropdownColor: AppColors.accentMaterial,
              items: categories
                  .map((value) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.khand(
                            color: const Color(AppColors.lightGrey),
                            fontSize: 18),
                      )))
                  .toList(),
              onChanged: ((value) {
                ref.read(exerciseCategoryProvider.notifier).state =
                    value as String;
              })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(AppColors.darkGrey),
                  foregroundColor: const Color(AppColors.lightGrey),
                  textStyle: AppStyles.button,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cancel',
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(AppColors.darkRed),
                  foregroundColor: const Color(AppColors.lightGrey),
                  textStyle: AppStyles.button,
                ),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Type exercise name')));
                  } else {
                    if (isAdd) {
                      final exerciseToAdd =
                          Exercise(nameController.text, scheme, '0', category);
                      box.add(exerciseToAdd);
                    } else {
                      final exerciseKey = ref.read(exerciseKeyProvider);
                      final exerciseToUpdate = Exercise(nameController.text,
                          scheme, personalBestController.text, category);
                      box.put(exerciseKey, exerciseToUpdate);
                    }
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'Exercise ${isAdd ? 'added' : 'updated'}',
                      textAlign: TextAlign.center,
                    )));
                  }
                },
                label: Text(
                  isAdd ? 'Add' : 'Update',
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
