import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/scheduled_message.dart';
import '../repository/scheduled_messages.dart';


/// Use case for updating an existing scheduled message
class UpdateScheduledMessage {
  final ScheduledMessagesRepository _repository;

  const UpdateScheduledMessage(this._repository);

  /// Execute the use case
  Future<void> execute(ScheduledMessage message) async {
    // Validate input
    if (message.id == null) {
      throw ArgumentError('Message ID is required for update');
    }
    if (message.title.trim().isEmpty) {
      throw ArgumentError('Message title cannot be empty');
    }
    if (message.content.trim().isEmpty) {
      throw ArgumentError('Message content cannot be empty');
    }
    if (message.scheduledDateTime.isBefore(DateTime.now())) {
      throw ArgumentError('Scheduled time must be in the future');
    }

    // Update in repository
    await _repository.updateScheduledMessage(message);
  }
}

/// Provider for UpdateScheduledMessage use case
final updateScheduledMessageProvider = Provider<UpdateScheduledMessage>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryProvider);
  return UpdateScheduledMessage(repository);
});
