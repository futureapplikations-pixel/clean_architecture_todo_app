import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/message_template.dart';
import '../repository/scheduled_messages.dart';

class UpdateMessageTemplate {
  final ScheduledMessagesRepository _repository;

  UpdateMessageTemplate(this._repository);

  Future<void> call(MessageTemplate template) => _repository.updateMessageTemplate(template);
}

final updateMessageTemplateProvider = Provider<UpdateMessageTemplate>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryProvider);
  return UpdateMessageTemplate(repository);
});
