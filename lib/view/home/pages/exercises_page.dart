import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/app_colors.dart';
import 'package:wrkt_ctrl/app_lists.dart';
import 'package:wrkt_ctrl/providers/exercises_provider.dart';
import 'package:wrkt_ctrl/view/home/widgets/logo.dart';
import 'package:wrkt_ctrl/view/home/widgets/nav_button.dart';

import '../widgets/exercises/put_exercise.dart';
import '../widgets/exercises/exercises_builder.dart';

class ExercisesPage extends ConsumerWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muscleGroups = AppLists.muscleGroups;
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 48,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Logo('exercises'),
              ),
              IconButton(
                  iconSize: 32,
                  onPressed: () {
                    ref.invalidate(exerciseCategoryProvider);
                    ref.invalidate(exerciseNameProvider);
                    ref.invalidate(exerciseTypeProvider);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          clipBehavior: Clip.antiAlias,
                          contentPadding: EdgeInsets.all(0),
                          actionsPadding: EdgeInsets.all(0),
                          content: PutExercise(null),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.accentMaterial,
                  )),
            ],
          ),
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: muscleGroups.length,
              itemBuilder: (context, index) {
                return NavButton(muscleGroups[index]);
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const ExercisesBuilder(),
        ],
      ),
    );
  }
}
