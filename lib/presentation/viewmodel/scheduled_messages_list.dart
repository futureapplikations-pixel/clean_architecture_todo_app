import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart';
import '../../domain/repository/scheduled_messages.dart';
import '../../data/repository/scheduled_messages_impl.dart';

/// ViewModel for managing scheduled messages list
class ScheduledMessagesListViewModel extends Notifier<List<ScheduledMessage>> {
  @override
  List<ScheduledMessage> build() {
    _loadScheduledMessages();
    return [];
  }

  /// Get the repository from the provider
  ScheduledMessagesRepository get _repository =>
      ref.read(scheduledMessagesRepositoryProvider);

  /// Load all scheduled messages
  Future<void> _loadScheduledMessages() async {
    try {
      final messages = await _repository.getScheduledMessages();
      state = messages;
    } catch (e) {
      // Handle error - for now just set empty list
      state = [];
    }
  }

  /// Refresh the list
  Future<void> refresh() async {
    await _loadScheduledMessages();
  }

  /// Get active scheduled messages only
  Future<void> loadActiveOnly() async {
    try {
      final messages = await _repository.getActiveScheduledMessages();
      state = messages;
    } catch (e) {
      state = [];
    }
  }

  /// Get due messages (ready to be sent)
  Future<void> loadDueMessages() async {
    try {
      final messages = await _repository.getDueScheduledMessages();
      state = messages;
    } catch (e) {
      state = [];
    }
  }

  /// Delete a scheduled message
  Future<void> deleteMessage(int messageId) async {
    try {
      await _repository.deleteScheduledMessage(messageId);
      await _loadScheduledMessages(); // Refresh the list
    } catch (e) {
      // Handle error
    }
  }

  /// Mark a message as sent
  Future<void> markMessageAsSent(int messageId) async {
    try {
      await _repository.markScheduledMessageAsSent(messageId);
      await _loadScheduledMessages(); // Refresh the list
    } catch (e) {
      // Handle error
    }
  }
}

/// Provider for ScheduledMessagesListViewModel
final scheduledMessagesListViewModelProvider =
    NotifierProvider<ScheduledMessagesListViewModel, List<ScheduledMessage>>(
  ScheduledMessagesListViewModel.new,
);
