import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart';

class ScheduledMessagesListViewModel extends Notifier<List<ScheduledMessage>> {
  @override
  List<ScheduledMessage> build() {
    return [];
  }

  void refresh() {}

  void loadActiveOnly() {}

  void loadDueMessages() {}

  void deleteMessage(int id) {}

  void markMessageAsSent(int id) {}
}