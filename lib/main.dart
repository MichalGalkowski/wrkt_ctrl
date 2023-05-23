import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkt_ctrl/app_colors.dart';
import 'package:wrkt_ctrl/models/exercise.dart';

import 'view/home/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseAdapter());
  await Hive.openBox('exercises');
  await Hive.openBox('routines');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryMaterial[900]));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WRKT_CTRL',
      theme: customTheme(),
      home: const HomeScreen(),
    );
  }
}

ThemeData customTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Color(AppColors.lightGrey)),
    ),
    iconTheme: const IconThemeData(color: Color(AppColors.lightGrey)),
    scaffoldBackgroundColor: const Color(AppColors.darkBlue),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: AppColors.primaryMaterial),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.accentMaterial,
      backgroundColor: const Color(AppColors.darkGrey),
      accentColor: const Color(AppColors.darkBlue),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Color(AppColors.grey)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: Color(AppColors.darkRed)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            const BorderSide(width: 1, color: Color(AppColors.lightGrey)),
      ),
    ),
  );
}
