import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/providers/navigation_provider.dart';
import 'package:wrkt_ctrl/view/home/pages/home_page.dart';
import 'package:wrkt_ctrl/view/home/widgets/nav_bar.dart';

import 'pages/exercises_page.dart';
import 'pages/plan_page.dart';
import 'pages/routines_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeIndexProvider);
    Widget page;
    switch (index) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const ExercisesPage();
        break;
      case 2:
        page = const RoutinesPage();
        break;
      case 3:
        page = const PlanPage();
        break;
      default:
        page = const HomePage();
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavBar(),
      body: page,
    );
  }
}
