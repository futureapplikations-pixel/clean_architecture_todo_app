import 'package:drift/drift.dart';
import '../../domain/model/scheduled_message.dart';
import '../source/database/database_impl.dart' as db;

/// Mapper class for converting between ScheduledMessage domain model and database entities
class ScheduledMessageMapper {
  /// Convert database entity to domain model
  static ScheduledMessage fromEntity(db.ScheduledMessage entity) {
    return ScheduledMessage(
      id: entity.id,
      mementoId: entity.mementoId,
      messageType: MessageType.values.firstWhere(
        (type) => type.name == entity.messageType,
        orElse: () => MessageType.sms, // Default fallback
      ),
      title: entity.title,
      content: entity.content,
      scheduledDateTime: DateTime.fromMillisecondsSinceEpoch(entity.scheduledDateTime),
      isActive: entity.isActive == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(entity.createdAt),
      sentAt: entity.sentAt != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.sentAt!)
          : null,
    );
  }

  /// Convert domain model to database entity for insertion
  static db.ScheduledMessagesCompanion toInsertCompanion(ScheduledMessage message) {
    return db.ScheduledMessagesCompanion.insert(
      mementoId: message.mementoId,
      messageType: message.messageType.name,
      title: message.title,
      content: message.content,
      scheduledDateTime: message.scheduledDateTime.millisecondsSinceEpoch,
      isActive: Value(message.isActive ? 1 : 0),
      createdAt: message.createdAt.millisecondsSinceEpoch,
      sentAt: Value(message.sentAt?.millisecondsSinceEpoch),
    );
  }

  /// Convert domain model to database entity for update
  static db.ScheduledMessagesCompanion toUpdateCompanion(ScheduledMessage message) {
    return db.ScheduledMessagesCompanion(
      mementoId: Value(message.mementoId),
      messageType: Value(message.messageType.name),
      title: Value(message.title),
      content: Value(message.content),
      scheduledDateTime: Value(message.scheduledDateTime.millisecondsSinceEpoch),
      isActive: Value(message.isActive ? 1 : 0),
      createdAt: Value(message.createdAt.millisecondsSinceEpoch),
      sentAt: Value(message.sentAt?.millisecondsSinceEpoch),
    );
  }

  /// Convert list of database entities to domain models
  static List<ScheduledMessage> fromEntityList(List<db.ScheduledMessage> entities) {
    return entities.map(fromEntity).toList();
  }
}
