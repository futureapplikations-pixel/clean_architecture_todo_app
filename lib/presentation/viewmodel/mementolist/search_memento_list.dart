import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repository/mementos_impl.dart';
import '../../../domain/model/memento.dart';

part 'search_memento_list.g.dart';

@riverpod
class SearchMementoListViewModel extends _$SearchMementoListViewModel {
  @override
  Future<List<Memento>> build(String query) async {
    final model = ref.watch(mementosRepositoryImplProvider.notifier);
    return model.searchMementos(query);
  }
}
