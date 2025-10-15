import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/message_template.dart';
import '../repository/scheduled_messages.dart';

class InsertMessageTemplate {
  final ScheduledMessagesRepository _repository;

  InsertMessageTemplate(this._repository);

  Future<MessageTemplate> call(MessageTemplate template) => _repository.insertMessageTemplate(template);
}

final insertMessageTemplateProvider = Provider<InsertMessageTemplate>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryImplProvider);
  return InsertMessageTemplate(repository);
});
