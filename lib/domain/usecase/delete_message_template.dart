import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/scheduled_messages.dart';

class DeleteMessageTemplate {
  final ScheduledMessagesRepository _repository;

  DeleteMessageTemplate(this._repository);

  Future<void> call(int id) => _repository.deleteMessageTemplate(id);
}

final deleteMessageTemplateProvider = Provider<DeleteMessageTemplate>((ref) {
  final repository = ref.watch(scheduledMessagesRepositoryImplProvider);
  return DeleteMessageTemplate(repository);
});
