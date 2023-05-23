import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrkt_ctrl/models/routine_exercise.dart';

part 'routine.g.dart';

@HiveType(typeId: 1)
class Routine {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int restTime;
  @HiveField(4)
  final int circuits;
  @HiveField(5)
  final List<RoutineExercise> exercises;
  @HiveField(6)
  final String category;

  Routine(this.id, this.name, this.description, this.restTime, this.circuits,
      this.exercises, this.category);
}
