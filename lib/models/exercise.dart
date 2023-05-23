import 'package:hive_flutter/hive_flutter.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int type;
  @HiveField(2)
  final String personalBest;
  @HiveField(3)
  final String category;

  Exercise(this.name, this.type, this.personalBest, this.category);
}
