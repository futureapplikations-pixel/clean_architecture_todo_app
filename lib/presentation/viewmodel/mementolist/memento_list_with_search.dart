import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repository/mementos_impl.dart';
import '../../../domain/model/memento.dart';
import 'memento_filter_kind.dart';

part 'memento_list_with_search.g.dart';

// Provider to hold the current search query
@riverpod
class SearchQueryNotifier extends _$SearchQueryNotifier {
  @override
  String build() => '';
}

@riverpod
class MementoListWithSearchViewModel extends _$MementoListWithSearchViewModel {
  @override
  Future<List<Memento>> build() async {
    // Watch the search query for changes - this makes the provider reactive
    final searchQuery = ref.watch(searchQueryNotifierProvider);
    // Also watch the filter kind for changes
    final filterKind = ref.watch(mementoFilterKindProvider);

    if (searchQuery.trim().isEmpty) {
      // Return all mementos when no search query
      final mementos = await ref
          .watch(mementosRepositoryImplProvider.notifier)
          .getMementos();
      return _applyFilter(mementos, filterKind);
    } else {
      // Return search results
      final mementos = await ref
          .watch(mementosRepositoryImplProvider.notifier)
          .searchMementos(searchQuery);
      return _applyFilter(mementos, filterKind);
    }
  }

  List<Memento> _applyFilter(
      List<Memento> mementos, MementoFilterKind filterKind) {
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
