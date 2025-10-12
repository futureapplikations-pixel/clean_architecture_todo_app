import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/memento.dart';
import '../../../domain/repository/mementos.dart';
import 'memento_filter_kind.dart';

part 'memento_list.g.dart';

@riverpod
class MementoListViewModel extends _$MementoListViewModel {
  @override
  Future<List<Memento>> build() async {
    final mementos = await ref.watch(mementosRepositoryProvider).getMementos();
    final filterKind = ref.watch(mementoFilterKindProvider);
    // TODO: Implement filter logic
    return mementos;
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
    await ref.read(mementosRepositoryProvider).createMemento(
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
    await ref.read(mementosRepositoryProvider).updateMemento(
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
    await ref.read(mementosRepositoryProvider).deleteMemento(id);
    ref.invalidateSelf();
  }

  Future<void> deleteAllMementos() async {
    await ref.read(mementosRepositoryProvider).deleteAllMementos();
    ref.invalidateSelf();
  }
}
