import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/mementolist/memento_filter_kind.dart';

class ChipsBarWidget extends ConsumerWidget {
  const ChipsBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mementoFilterKindProvider.notifier);
    final selectedFilter = ref.watch(mementoFilterKindProvider);

    return SizedBox(
      height: kToolbarHeight,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        scrollDirection: Axis.horizontal,
        children: [
          FilterChip(
            label: const Text('All'),
            selected: selectedFilter == MementoFilterKind.all,
            onSelected: (_) => viewModel.filterByAll(),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Favorites'),
            selected: selectedFilter == MementoFilterKind.favorites,
            onSelected: (_) => viewModel.filterByFavorites(),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Recent'),
            selected: selectedFilter == MementoFilterKind.recent,
            onSelected: (_) => viewModel.filterByRecent(),
          ),
        ],
      ),
    );
  }
}