import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/models/exercise.dart';
import 'package:wrkt_ctrl/providers/exercises_provider.dart';

import '../../../../app_styles.dart';
import 'delete_exercise.dart';
import 'exercise_item.dart';
import 'put_exercise.dart';

class ExercisesBuilder extends ConsumerWidget {
  const ExercisesBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(exercisesProvider);
    return exercises.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                'You need to add your exercises',
                style: AppStyles.midText,
              ),
            ),
          )
        : Expanded(
            child: ValueListenableBuilder(
                valueListenable: exercises.listenable(),
                builder: (context, items, _) {
                  List<int> keys = items.keys.cast<int>().toList();
                  return ListView.builder(
                    itemCount: keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final int exerciseKey = keys[index];
                      final exercise = exercises.get(exerciseKey) as Exercise;
                      return Dismissible(
                          key: Key(exercise.key.toString()),
                          confirmDismiss: (direction) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    clipBehavior: Clip.antiAlias,
                                    contentPadding: const EdgeInsets.all(0),
                                    actionsPadding: const EdgeInsets.all(0),
                                    content: DeleteExercise(exercise),
                                  );
                                });
                          },
                          child: InkWell(
                              onTap: () {
                                ref.read(exerciseNameProvider.notifier).state =
                                    exercise.name;
                                ref.read(exerciseTypeProvider.notifier).state =
                                    exercise.type;
                                ref.read(exerciseKeyProvider.notifier).state =
                                    exerciseKey;
                                ref
                                    .read(exerciseCategoryProvider.notifier)
                                    .state = exercise.category;
                                ref
                                    .read(exercisePersonalBestProvider.notifier)
                                    .state = exercise.personalBest;
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        clipBehavior: Clip.antiAlias,
                                        contentPadding: const EdgeInsets.all(0),
                                        actionsPadding: const EdgeInsets.all(0),
                                        content: PutExercise(exercise),
                                      );
                                    });
                              },
                              child: ExerciseItem(exercise, exerciseKey)));
                    },
                  );
                }),
          );
  }
}
