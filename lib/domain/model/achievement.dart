import 'package:equatable/equatable.dart';

class Achievement extends Equatable {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String category;
  final int points;
  final bool unlocked;
  final DateTime? unlockedDate;
  final double progress;
  final int requirement;
  final int current;

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.category,
    required this.points,
    required this.unlocked,
    this.unlockedDate,
    required this.progress,
    required this.requirement,
    required this.current,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        icon,
        category,
        points,
        unlocked,
        unlockedDate,
        progress,
        requirement,
        current,
      ];
}