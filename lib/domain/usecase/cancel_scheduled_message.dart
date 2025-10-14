import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/scheduled_messages.dart';


/// Use case for canceling/deleting a scheduled message
class CancelScheduledMessage {
  final ScheduledMessagesRepository _repository;

  const CancelScheduledMessage(this._repository);

  /// Execute the use case
  Future<void> execute(int messageId) async {
    // Validate input
    if (messageId <= 0) {
      throw ArgumentError('Valid message ID is required');
    }

    // Delete from repository
    await _repository.deleteScheduledMessage(messageId);
  }
}

/// Provider for CancelScheduledMessage use case
final cancelScheduledMessageProvider = Provider<CancelScheduledMessage>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryProvider);
  return CancelScheduledMessage(repository);
});
