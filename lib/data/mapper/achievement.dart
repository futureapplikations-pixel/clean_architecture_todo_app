import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/achievement.dart';

class AchievementMapper {
  static Achievement fromAchievementEntity(AchievementEntity entity) {
    return Achievement(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      icon: entity.icon,
      category: entity.category,
      points: entity.points,
      unlocked: entity.unlocked,
      unlockedDate: entity.unlockedDate != null ? DateTime.fromMillisecondsSinceEpoch(entity.unlockedDate!) : null,
      progress: entity.progress,
      requirement: entity.requirement,
      current: entity.currentProgress,
    );
  }

  static AchievementEntity toAchievementEntity(Achievement model) {
    return AchievementEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      icon: model.icon,
      category: model.category,
      points: model.points,
      unlocked: model.unlocked,
      unlockedDate: model.unlockedDate?.millisecondsSinceEpoch,
      progress: model.progress,
      requirement: model.requirement,
      currentProgress: model.current,
    );
  }
}
