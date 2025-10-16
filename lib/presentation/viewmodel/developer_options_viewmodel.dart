import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/mementos_impl.dart';
import '../../domain/usecase/create_random_mementos.dart';

import '../../data/repository/scheduled_messages_impl.dart';
import '../../domain/usecase/create_random_events.dart';

part 'developer_options_viewmodel.g.dart';

@riverpod
CreateRandomMementos createRandomMementos(CreateRandomMementosRef ref) {
  final repository = ref.watch(mementosRepositoryImplProvider.notifier);
  return CreateRandomMementos(repository);
}

@riverpod
CreateRandomEvents createRandomEvents(CreateRandomEventsRef ref) {
  final scheduledMessagesRepository = ref.watch(scheduledMessagesRepositoryProvider);
  final mementosRepository = ref.watch(mementosRepositoryImplProvider.notifier);
  return CreateRandomEvents(scheduledMessagesRepository, mementosRepository);
}
