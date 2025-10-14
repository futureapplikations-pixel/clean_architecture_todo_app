import '../model/scheduled_message.dart';
import '../model/message_template.dart';

/// Repository interface for scheduled message operations
abstract class ScheduledMessagesRepository {
  /// Get all scheduled messages
  Future<List<ScheduledMessage>> getScheduledMessages();

  /// Get a scheduled message by ID
  Future<ScheduledMessage?> getScheduledMessageById(int id);

  /// Get scheduled messages for a specific memento
  Future<List<ScheduledMessage>> getScheduledMessagesForMemento(int mementoId);

  /// Get all active scheduled messages
  Future<List<ScheduledMessage>> getActiveScheduledMessages();

  /// Get due scheduled messages (ready to be sent)
  Future<List<ScheduledMessage>> getDueScheduledMessages();

  /// Insert a new scheduled message
  Future<ScheduledMessage> insertScheduledMessage(ScheduledMessage message);

  /// Update an existing scheduled message
  Future<void> updateScheduledMessage(ScheduledMessage message);

  /// Delete a scheduled message
  Future<void> deleteScheduledMessage(int id);

  /// Mark a scheduled message as sent
  Future<void> markScheduledMessageAsSent(int id);

  /// Watch all scheduled messages for real-time updates
  Stream<List<ScheduledMessage>> watchScheduledMessages();

  /// Watch scheduled messages for a specific memento
  Stream<List<ScheduledMessage>> watchScheduledMessagesForMemento(int mementoId);

  // Message Template operations
  Future<List<MessageTemplate>> getMessageTemplates();
  Future<MessageTemplate?> getMessageTemplateById(int id);
  Future<MessageTemplate> insertMessageTemplate(MessageTemplate template);
  Future<void> updateMessageTemplate(MessageTemplate template);
  Future<void> deleteMessageTemplate(int id);
}