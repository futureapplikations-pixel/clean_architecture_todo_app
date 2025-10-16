import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart';
import '../../domain/usecase/schedule_message.dart';
import '../../domain/usecase/update_scheduled_message.dart';

class ScheduledMessageFormViewModel extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> addMessage({
    required int mementoId,
    required MessageType messageType,
    required String title,
    required String content,
    required DateTime scheduledDateTime,
  }) async {
    state = const AsyncLoading();
    final usecase = ref.read(scheduleMessageProvider);
    state = await AsyncValue.guard(
      () => usecase.call(
        mementoId: mementoId,
        messageType: messageType,
        title: title,
        content: content,
        scheduledDateTime: scheduledDateTime,
      ),
    );
  }

  Future<void> updateMessage(ScheduledMessage message) async {
    state = const AsyncLoading();
    final usecase = ref.read(updateScheduledMessageProvider);
    state = await AsyncValue.guard(() => usecase.call(message));
  }
}

final scheduledMessageFormProvider =
    NotifierProvider<ScheduledMessageFormViewModel, AsyncValue<void>>(
  ScheduledMessageFormViewModel.new,
);
