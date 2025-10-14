import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart';
import '../../domain/repository/scheduled_messages.dart';

class MessageStatisticsState {
  final int totalSent;
  final int totalScheduled;
  final Map<MessageType, int> sentByType;
  final Map<MessageType, int> scheduledByType;

  MessageStatisticsState({
    this.totalSent = 0,
    this.totalScheduled = 0,
    this.sentByType = const {},
    this.scheduledByType = const {},
  });

  MessageStatisticsState copyWith({
    int? totalSent,
    int? totalScheduled,
    Map<MessageType, int>? sentByType,
    Map<MessageType, int>? scheduledByType,
  }) {
    return MessageStatisticsState(
      totalSent: totalSent ?? this.totalSent,
      totalScheduled: totalScheduled ?? this.totalScheduled,
      sentByType: sentByType ?? this.sentByType,
      scheduledByType: scheduledByType ?? this.scheduledByType,
    );
  }
}

class MessageStatisticsViewModel extends StateNotifier<AsyncValue<MessageStatisticsState>> {
  final ScheduledMessagesRepository _repository;

  MessageStatisticsViewModel(this._repository) : super(const AsyncValue.loading()) {
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    try {
      final messages = await _repository.getScheduledMessages();

      int totalSent = 0;
      int totalScheduled = 0;
      final Map<MessageType, int> sentByType = {};
      final Map<MessageType, int> scheduledByType = {};

      for (final type in MessageType.values) {
        sentByType[type] = 0;
        scheduledByType[type] = 0;
      }

      for (final message in messages) {
        if (message.sentAt != null) {
          totalSent++;
          sentByType[message.messageType] = (sentByType[message.messageType] ?? 0) + 1;
        } else {
          totalScheduled++;
          scheduledByType[message.messageType] = (scheduledByType[message.messageType] ?? 0) + 1;
        }
      }

      state = AsyncValue.data(MessageStatisticsState(
        totalSent: totalSent,
        totalScheduled: totalScheduled,
        sentByType: sentByType,
        scheduledByType: scheduledByType,
      ));
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final messageStatisticsViewModelProvider = StateNotifierProvider.autoDispose<
    MessageStatisticsViewModel, AsyncValue<MessageStatisticsState>>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryProvider);
  return MessageStatisticsViewModel(repository);
});
