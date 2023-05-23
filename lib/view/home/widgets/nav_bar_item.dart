import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/providers/navigation_provider.dart';

import '../../../app_colors.dart';

class NavBarItem extends ConsumerWidget {
  final String text;
  final int index;
  final IconData icon;
  const NavBarItem(
      {super.key, required this.text, required this.index, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeIndexProvider);
    return InkWell(
      onTap: () {
        ref.invalidate(filterProvider);
        ref.read(homeIndexProvider.notifier).state = index;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: Color(currentIndex == index
                    ? AppColors.darkRed
                    : AppColors.lightGrey)),
            Text(
              text,
              style: TextStyle(
                  color: Color(currentIndex == index
                      ? AppColors.darkRed
                      : AppColors.lightGrey)),
            ),
          ],
        ),
      ),
    );
  }
}
