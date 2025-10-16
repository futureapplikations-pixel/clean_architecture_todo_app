import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart' as domain;
import '../../domain/repository/scheduled_messages.dart';
import '../mapper/scheduled_message.dart';
import '../source/database/database.dart';
import '../source/database/database_impl.dart';

/// Implementation of ScheduledMessagesRepository using Drift database
class ScheduledMessagesRepositoryImpl implements ScheduledMessagesRepository {
  final Database _database;

  const ScheduledMessagesRepositoryImpl(this._database);

  @override
  Future<List<domain.ScheduledMessage>> getScheduledMessages() async {
    final entities = await _database.getScheduledMessages();
    return ScheduledMessageMapper.fromEntityList(entities);
  }

  @override
  Future<domain.ScheduledMessage?> getScheduledMessageById(int id) async {
    final entity = await _database.getScheduledMessageById(id);
    return entity != null ? ScheduledMessageMapper.fromEntity(entity) : null;
  }

  @override
  Future<List<domain.ScheduledMessage>> getScheduledMessagesForMemento(
      int mementoId) async {
    final entities = await _database.getScheduledMessagesForMemento(mementoId);
    return ScheduledMessageMapper.fromEntityList(entities);
  }

  @override
  Future<List<domain.ScheduledMessage>> getActiveScheduledMessages() async {
    final entities = await _database.getActiveScheduledMessages();
    return ScheduledMessageMapper.fromEntityList(entities);
  }

  @override
  Future<List<domain.ScheduledMessage>> getDueScheduledMessages() async {
    final entities = await _database.getDueScheduledMessages(DateTime.now());
    return ScheduledMessageMapper.fromEntityList(entities);
  }

  @override
  Future<domain.ScheduledMessage> insertScheduledMessage(
      domain.ScheduledMessage message) async {
    final entity = await _database.insertScheduledMessage(
      ScheduledMessageMapper.toInsertCompanion(message),
    );
    return ScheduledMessageMapper.fromEntity(entity);
  }

  @override
  Future<void> updateScheduledMessage(domain.ScheduledMessage message) async {
    await _database.updateScheduledMessage(
      message.id!,
      ScheduledMessageMapper.toUpdateCompanion(message),
    );
  }

  @override
  Future<void> deleteScheduledMessage(int id) async {
    await _database.deleteScheduledMessage(id);
  }

  @override
  Future<void> markScheduledMessageAsSent(int id) async {
    await _database.markScheduledMessageAsSent(id, DateTime.now());
  }

  @override
  Stream<List<domain.ScheduledMessage>> watchScheduledMessages() {
    // Note: Drift doesn't have a direct watch method for custom queries
    // This would need to be implemented using a custom stream or periodic updates
    // For now, returning an empty stream as a placeholder
    return Stream.empty();
  }

  @override
  Stream<List<domain.ScheduledMessage>> watchScheduledMessagesForMemento(
      int mementoId) {
    // Note: Drift doesn't have a direct watch method for custom queries
    // This would need to be implemented using a custom stream or periodic updates
    // For now, returning an empty stream as a placeholder
    return Stream.empty();
  }
}

/// Provider for ScheduledMessagesRepository
final scheduledMessagesRepositoryProvider =
    Provider<ScheduledMessagesRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return ScheduledMessagesRepositoryImpl(database);
});
