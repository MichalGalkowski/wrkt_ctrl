import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/providers/navigation_provider.dart';

import '../../../app_colors.dart';

class NavButton extends ConsumerWidget {
  final String text;
  const NavButton(this.text, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = text == ref.watch(filterProvider);
    return GestureDetector(
      onTap: () => ref.read(filterProvider.notifier).state = text,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected
                ? AppColors.accentMaterial
                : AppColors.primaryMaterial[700],
            border: Border.all(color: AppColors.accentMaterial, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text.toUpperCase(),
              style: GoogleFonts.khand(
                color: isSelected
                    ? AppColors.primaryMaterial
                    : AppColors.accentMaterial,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
