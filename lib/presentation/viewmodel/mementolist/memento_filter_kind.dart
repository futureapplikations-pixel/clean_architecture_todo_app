import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MementoFilterKind { all, favorites, recent }

final mementoFilterKindProvider =
    StateNotifierProvider.autoDispose<MementoFilterKindViewModel, MementoFilterKind>(
  (_) => MementoFilterKindViewModel(),
);

class MementoFilterKindViewModel extends StateNotifier<MementoFilterKind> {
  MementoFilterKindViewModel() : super(MementoFilterKind.all);

  void filterByAll() => state = MementoFilterKind.all;

  void filterByFavorites() => state = MementoFilterKind.favorites;

  void filterByRecent() => state = MementoFilterKind.recent;
}