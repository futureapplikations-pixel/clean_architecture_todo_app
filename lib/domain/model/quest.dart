import 'package:equatable/equatable.dart';

class Quest extends Equatable {
  final String id;
  final String name;
  final String description;
  final int points;
  final bool completed;
  final double progress;
  final int requirement;

  const Quest({
    required this.id,
    required this.name,
    required this.description,
    required this.points,
    required this.completed,
    required this.progress,
    required this.requirement,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        points,
        completed,
        progress,
        requirement,
      ];
}
