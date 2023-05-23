import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class Logo extends StatelessWidget {
  final String text;
  const Logo(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.khand(
        color: AppColors.accentMaterial,
        fontSize: 56,
      ),
      textAlign: TextAlign.center,
    );
  }
}
