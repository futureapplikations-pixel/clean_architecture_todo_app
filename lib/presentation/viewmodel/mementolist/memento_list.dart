import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repository/mementos_impl.dart';
import '../../../domain/model/memento.dart';
import 'memento_filter_kind.dart';

part 'memento_list.g.dart';

@riverpod
class MementoListViewModel extends _$MementoListViewModel {
  @override
  Future<List<Memento>> build() async {
    final mementos = await ref.watch(mementosRepositoryImplProvider.notifier).getMementos();
    final filterKind = ref.watch(mementoFilterKindProvider);
    // Filter logic implementation
    switch (filterKind) {
      case MementoFilterKind.all:
        return mementos;
      case MementoFilterKind.favorites:
        // For now, return all mementos as favorites logic needs to be implemented
        return mementos;
      case MementoFilterKind.recent:
        // For now, return all mementos as recent logic needs to be implemented
        return mementos;
    }
  }

  Future<void> addMemento({
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  }) async {
    await ref.read(mementosRepositoryImplProvider.notifier).createMemento(
          name: name,
          photo: photo,
          email: email,
          phone: phone,
          context: context,
          jobTitle: jobTitle,
          company: company,
          birthday: birthday,
        );
    ref.invalidateSelf();
  }

  Future<void> updateMemento(
    int id, {
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  }) async {
    await ref.read(mementosRepositoryImplProvider.notifier).updateMemento(
          id,
          name: name,
          photo: photo,
          email: email,
          phone: phone,
          context: context,
          jobTitle: jobTitle,
          company: company,
          birthday: birthday,
        );
    ref.invalidateSelf();
  }

  Future<void> deleteMemento(final int id) async {
    await ref.read(mementosRepositoryImplProvider.notifier).deleteMemento(id);
    ref.invalidateSelf();
  }

  Future<void> deleteAllMementos() async {
    await ref.read(mementosRepositoryImplProvider.notifier).deleteAllMementos();
    ref.invalidateSelf();
  }
}
