import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/quest.dart';

class QuestMapper {
  static Quest fromQuestEntity(QuestEntity entity) {
    return Quest(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      points: entity.points,
      completed: entity.completed,
      progress: entity.progress,
      requirement: entity.requirement,
    );
  }

  static QuestEntity toQuestEntity(Quest model) {
    return QuestEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      points: model.points,
      completed: model.completed,
      progress: model.progress,
      requirement: model.requirement,
    );
  }
}
