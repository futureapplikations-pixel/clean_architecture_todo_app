import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/message_template.dart';

class MessageTemplateMapper {
  static MessageTemplate fromMessageTemplateEntity(MessageTemplateEntity entity) {
    return MessageTemplate(
      id: entity.id,
      name: entity.name,
      content: entity.content,
      category: entity.category,
    );
  }

  static MessageTemplateEntity toMessageTemplateEntity(MessageTemplate model) {
    return MessageTemplateEntity(
      id: model.id,
      name: model.name,
      content: model.content,
      category: model.category,
    );
  }
}
