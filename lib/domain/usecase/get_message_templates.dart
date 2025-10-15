import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/message_template.dart';
import '../repository/scheduled_messages.dart';

class GetMessageTemplates {
  final ScheduledMessagesRepository _repository;

  GetMessageTemplates(this._repository);

  Future<List<MessageTemplate>> call() => _repository.getMessageTemplates();
}

final getMessageTemplatesProvider = Provider<GetMessageTemplates>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryImplProvider);
  return GetMessageTemplates(repository);
});
