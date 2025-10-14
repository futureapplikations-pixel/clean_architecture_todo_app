import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/scheduled_message.dart';
import '../../domain/model/message_template.dart';
import '../../domain/repository/scheduled_messages.dart';
import '../mapper/scheduled_message.dart';
import '../mapper/message_template.dart';
import '../source/database/database.dart';
import '../source/database/database_impl.dart' as db;

part 'scheduled_messages_impl.g.dart';

@riverpod
class ScheduledMessagesRepositoryImpl extends _$ScheduledMessagesRepositoryImpl
    implements ScheduledMessagesRepository {
  late final Database database = ref.read(db.databaseProvider);

  @override
  Stream<List<ScheduledMessage>> build() {
    return database.watchScheduledMessages().map(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<void> deleteScheduledMessage(int messageId) {
    return database.deleteScheduledMessage(messageId);
  }

  @override
  Future<List<ScheduledMessage>> getActiveScheduledMessages() {
    return database.getActiveScheduledMessages().then(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<List<ScheduledMessage>> getDueScheduledMessages() {
    return database.getDueScheduledMessages(DateTime.now()).then(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<ScheduledMessage> getScheduledMessageById(int id) async {
    final entity = await database.getScheduledMessageById(id);
    if (entity == null) {
      throw Exception('Scheduled message not found');
    }
    return ScheduledMessageMapper.transformToModel(entity);
  }

  @override
  Future<List<ScheduledMessage>> getScheduledMessages() {
    return database.getScheduledMessages().then(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<List<ScheduledMessage>> getScheduledMessagesForMemento(int mementoId) {
    return database.getScheduledMessagesForMemento(mementoId).then(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<ScheduledMessage> insertScheduledMessage(ScheduledMessage message) async {
    final entity = await database.insertScheduledMessage(
      db.ScheduledMessagesCompanion.insert(
        mementoId: message.mementoId,
        messageType: message.messageType.name,
        title: message.title,
        content: message.content,
        scheduledDateTime: message.scheduledDateTime.millisecondsSinceEpoch,
        isActive: message.isActive,
        createdAt: message.createdAt.millisecondsSinceEpoch,
        sentAt: db.Val(message.sentAt?.millisecondsSinceEpoch),
      ),
    );
    return ScheduledMessageMapper.transformToModel(entity);
  }

  @override
  Future<void> markScheduledMessageAsSent(int id) {
    return database.markScheduledMessageAsSent(id, DateTime.now());
  }

  @override
  Future<void> updateScheduledMessage(ScheduledMessage message) {
    return database.updateScheduledMessage(
      message.id!,
      db.ScheduledMessagesCompanion(
        mementoId: db.Val(message.mementoId),
        messageType: db.Val(message.messageType.name),
        title: db.Val(message.title),
        content: db.Val(message.content),
        scheduledDateTime: db.Val(message.scheduledDateTime.millisecondsSinceEpoch),
        isActive: db.Val(message.isActive),
        sentAt: db.Val(message.sentAt?.millisecondsSinceEpoch),
      ),
    );
  }

  @override
  Stream<List<ScheduledMessage>> watchScheduledMessages() {
    return database.getScheduledMessages().watch().map(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Stream<List<ScheduledMessage>> watchScheduledMessagesForMemento(int mementoId) {
    return database.getScheduledMessagesForMemento(mementoId).watch().map(ScheduledMessageMapper.transformToModelList);
  }

  @override
  Future<List<MessageTemplate>> getMessageTemplates() {
    return database.getMessageTemplates().then(MessageTemplateMapper.fromMessageTemplateEntityList);
  }

  @override
  Future<MessageTemplate?> getMessageTemplateById(int id) async {
    final entity = await database.getMessageTemplateById(id);
    if (entity == null) {
      return null;
    }
    return MessageTemplateMapper.fromMessageTemplateEntity(entity);
  }

  @override
  Future<MessageTemplate> insertMessageTemplate(MessageTemplate template) async {
    final id = await database.insertMessageTemplate(
      db.MessageTemplatesCompanion.insert(
        name: template.name,
        content: template.content,
        category: template.category,
      ),
    );
    final entity = await database.getMessageTemplateById(id);
    return MessageTemplateMapper.fromMessageTemplateEntity(entity!); // entity will not be null after insert
  }

  @override
  Future<void> updateMessageTemplate(MessageTemplate template) {
    return database.updateMessageTemplate(
      template.id!,
      db.MessageTemplatesCompanion(
        name: db.Val(template.name),
        content: db.Val(template.content),
        category: db.Val(template.category),
      ),
    );
  }

  @override
  Future<void> deleteMessageTemplate(int id) {
    return database.deleteMessageTemplate(id);
  }
}