import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle midHeader = GoogleFonts.khand(
    color: AppColors.accentMaterial,
    fontSize: 36,
  );
  static TextStyle midText = GoogleFonts.khand(
    color: const Color(AppColors.lightGrey),
    fontSize: 24,
  );
  static TextStyle smallText = GoogleFonts.khand(
    color: const Color(AppColors.lightGrey),
    fontSize: 18,
  );
  static TextStyle button = GoogleFonts.khand(
    color: const Color(AppColors.lightGrey),
    fontSize: 24,
  );
}
