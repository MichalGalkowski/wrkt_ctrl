import 'package:flutter/material.dart';
import 'package:wrkt_ctrl/app_colors.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .8,
      height: width * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryMaterial[700],
        border: Border.all(color: AppColors.accentMaterial, width: 2),
      ),
    );
  }
}
