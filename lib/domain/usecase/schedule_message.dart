import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/scheduled_message.dart';
import '../repository/scheduled_messages.dart';


/// Use case for scheduling a new message
class ScheduleMessage {
  final ScheduledMessagesRepository _repository;

  const ScheduleMessage(this._repository);

  /// Execute the use case
  Future<ScheduledMessage> execute({
    required int mementoId,
    required MessageType messageType,
    required String title,
    required String content,
    required DateTime scheduledDateTime,
  }) async {
    // Validate input
    if (title.trim().isEmpty) {
      throw ArgumentError('Message title cannot be empty');
    }
    if (content.trim().isEmpty) {
      throw ArgumentError('Message content cannot be empty');
    }
    if (scheduledDateTime.isBefore(DateTime.now())) {
      throw ArgumentError('Scheduled time must be in the future');
    }

    // Create the scheduled message
    final message = ScheduledMessage(
      mementoId: mementoId,
      messageType: messageType,
      title: title.trim(),
      content: content.trim(),
      scheduledDateTime: scheduledDateTime,
      createdAt: DateTime.now(),
    );

    // Save to repository
    return await _repository.insertScheduledMessage(message);
  }
}

/// Provider for ScheduleMessage use case
final scheduleMessageProvider = Provider<ScheduleMessage>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryProvider);
  return ScheduleMessage(repository);
});
