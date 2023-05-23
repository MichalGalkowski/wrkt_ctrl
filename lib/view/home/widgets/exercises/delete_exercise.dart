import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrkt_ctrl/app_styles.dart';
import '../../../../app_colors.dart';
import '../../../../models/exercise.dart';

class DeleteExercise extends StatelessWidget {
  final Exercise exercise;
  const DeleteExercise(this.exercise, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryMaterial[800],
        border: Border.all(color: AppColors.accentMaterial, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Do you want to delete ${exercise.name}?',
            textAlign: TextAlign.center,
            style: AppStyles.midHeader,
          ),
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
                  final exercisesBox = Hive.box('exercises');
                  exercisesBox.delete(exercise.key);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Exercise deleted',
                    textAlign: TextAlign.center,
                  )));
                },
                label: const Text(
                  'Delete',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
