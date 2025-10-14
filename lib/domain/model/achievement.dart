import 'package:equatable/equatable.dart';

enum AchievementCategory {
  social,
  productivity,
  consistency,
  milestone,
  special,
}

enum AchievementRarity {
  common,
  rare,
  epic,
  legendary,
}

class Achievement extends Equatable {
  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.rarity,
    required this.icon,
    required this.points,
    required this.requirements,
    this.unlockedAt,
    this.progress = 0,
    this.maxProgress = 1,
  });

  final String id;
  final String name;
  final String description;
  final AchievementCategory category;
  final AchievementRarity rarity;
  final String icon;
  final int points;
  final List<AchievementRequirement> requirements;
  final DateTime? unlockedAt;
  final int progress;
  final int maxProgress;

  bool get isUnlocked => unlockedAt != null;
  bool get isCompleted => progress >= maxProgress;
  double get progressPercentage => maxProgress > 0 ? (progress / maxProgress) * 100 : 0;

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    AchievementCategory? category,
    AchievementRarity? rarity,
    String? icon,
    int? points,
    List<AchievementRequirement>? requirements,
    DateTime? unlockedAt,
    int? progress,
    int? maxProgress,
  }) {
    return Achievement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      rarity: rarity ?? this.rarity,
      icon: icon ?? this.icon,
      points: points ?? this.points,
      requirements: requirements ?? this.requirements,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      progress: progress ?? this.progress,
      maxProgress: maxProgress ?? this.maxProgress,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        rarity,
        icon,
        points,
        requirements,
        unlockedAt,
        progress,
        maxProgress,
      ];
}

class AchievementRequirement extends Equatable {
  const AchievementRequirement({
    required this.type,
    required this.target,
    this.currentValue = 0,
  });

  final AchievementRequirementType type;
  final int target;
  final int currentValue;

  bool get isCompleted => currentValue >= target;
  double get progressPercentage => target > 0 ? (currentValue / target) * 100 : 0;

  AchievementRequirement copyWith({
    AchievementRequirementType? type,
    int? target,
    int? currentValue,
  }) {
    return AchievementRequirement(
      type: type ?? this.type,
      target: target ?? this.target,
      currentValue: currentValue ?? this.currentValue,
    );
  }

  @override
  List<Object?> get props => [type, target, currentValue];
}

enum AchievementRequirementType {
  mementosCreated,
  notesAdded,
  messagesSent,
  labelsCreated,
  consecutiveDays,
  totalInteractions,
  specialActions,
}
