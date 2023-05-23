import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exerciseTypeProvider = StateProvider((ref) => 0);
final exerciseKeyProvider = StateProvider((ref) => 0);
final exerciseCategoryProvider = StateProvider((ref) => 'fullbody');
final exerciseNameProvider = StateProvider((ref) => '');
final exercisePersonalBestProvider = StateProvider((ref) => '');

final exercisesProvider = StateProvider((ref) {
  final exercisesBox = Hive.box('exercises');
  return exercisesBox;
});
