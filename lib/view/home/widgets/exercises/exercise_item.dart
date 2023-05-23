import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/app_colors.dart';
import 'package:wrkt_ctrl/app_styles.dart';

import '../../../../models/exercise.dart';
import '../../../../providers/navigation_provider.dart';

class ExerciseItem extends ConsumerWidget {
  final Exercise exercise;
  final int index;
  const ExerciseItem(this.exercise, this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    if (filter == 'all' || exercise.category == filter) {
      return Card(
        color: AppColors.primaryMaterial.shade800,
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  exercise.name,
                  style: AppStyles.midText,
                ),
              ),
              Text(
                'Personal best: ${exercise.personalBest} ${exercise.type == 0 && exercise.personalBest != 'none' ? 'reps' : ''}',
                style: AppStyles.smallText,
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
