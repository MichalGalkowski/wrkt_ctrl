import 'package:flutter/material.dart';
import 'package:wrkt_ctrl/view/routine/add_routine_screen.dart';

import '../../../app_colors.dart';
import '../../../app_lists.dart';
import '../widgets/logo.dart';
import '../widgets/nav_button.dart';

class RoutinesPage extends StatelessWidget {
  const RoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final muscleGroups = AppLists.routineGroups;
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
                child: Logo('routines'),
              ),
              IconButton(
                  iconSize: 32,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddRoutineScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.accentMaterial,
                  )),
            ],
          ),
          Flexible(
            child: SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: muscleGroups.length,
                itemBuilder: (context, index) {
                  return NavButton(muscleGroups[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
