import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/providers/navigation_provider.dart';

import 'pages/add_routine_exercises_page.dart';
import 'pages/add_routine_summary_page.dart';

class AddRoutineScreen extends ConsumerWidget {
  const AddRoutineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(addRoutineIndexProvider);
    Widget page;
    switch (index) {
      case 0:
        page = const AddRoutineExercisesPage();
        break;
      case 1:
        page = const AddRoutineSummaryPage();
        break;
      default:
        page = const AddRoutineExercisesPage();
    }
    return Scaffold(
      body: SafeArea(child: page),
    );
  }
}
