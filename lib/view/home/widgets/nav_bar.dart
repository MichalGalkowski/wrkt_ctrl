import 'package:flutter/material.dart';
import 'package:wrkt_ctrl/view/home/widgets/nav_bar_item.dart';

import '../../../app_colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 6.0,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 62,
                decoration: const BoxDecoration(
                  color: AppColors.accentMaterial,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primaryMaterial[700],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      NavBarItem(text: 'Home', index: 0, icon: Icons.home),
                      NavBarItem(
                          text: 'Exercises',
                          index: 1,
                          icon: Icons.fitness_center),
                      NavBarItem(text: 'Rotines', index: 2, icon: Icons.list),
                      NavBarItem(
                          text: 'Week plan',
                          index: 3,
                          icon: Icons.calendar_view_week),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
