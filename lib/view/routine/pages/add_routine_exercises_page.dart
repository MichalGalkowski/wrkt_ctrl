import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/app_colors.dart';
import 'package:wrkt_ctrl/app_styles.dart';
import 'package:wrkt_ctrl/providers/navigation_provider.dart';

class AddRoutineExercisesPage extends ConsumerWidget {
  const AddRoutineExercisesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                SizedBox(
                  width: 200,
                  child: TextField(
                    maxLength: 10,
                    style: TextStyle(color: Color(AppColors.lightGrey)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rest time (in seconds)',
                      labelStyle: TextStyle(color: Color(AppColors.lightGrey)),
                      counterText: '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    maxLength: 10,
                    style: TextStyle(color: Color(AppColors.lightGrey)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Circuits',
                      labelStyle: TextStyle(color: Color(AppColors.lightGrey)),
                      counterText: '',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(AppColors.darkRed), width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '+',
                    style: TextStyle(
                        fontSize: 72, color: Color(AppColors.lightGrey)),
                  ),
                  Text(
                    'Add Exercise',
                    style: AppStyles.button,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text('List of routines placeholder'),
        )),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(AppColors.darkGrey)),
                child: Text(
                  'Cancel',
                  style: AppStyles.button,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(addRoutineIndexProvider.notifier).state = 1;
                },
                child: Text(
                  'Next page',
                  style: AppStyles.button,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
