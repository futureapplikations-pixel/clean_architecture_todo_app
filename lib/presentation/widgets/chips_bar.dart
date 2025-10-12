import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/mementolist/memento_filter_kind.dart';

class ChipsBarWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mementoFilterKindProvider.notifier);
    return SizedBox(
      height: kToolbarHeight,
      child: ListView(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
        scrollDirection: Axis.horizontal,
        children: [
          buildGroupChip(
            context,
            viewModel.isFilteredByAll(),
            'All',
            viewModel.filterByAll,
          ),
          const SizedBox(width: 8),
          buildGroupChip(
            context,
            viewModel.isFilteredByFavorites(),
            'Favorites',
            viewModel.filterByFavorites,
          ),
          const SizedBox(width: 8),
          buildGroupChip(
            context,
            viewModel.isFilteredByRecent(),
            'Recent',
            viewModel.filterByRecent,
          ),
        ],
      ),
    );
  }

  Widget buildGroupChip(
    BuildContext context,
    bool checked,
    String label,
    VoidCallback onSelect,
  ) {
    return InputChip(
      showCheckmark: checked,
      label: Text(label),
      selected: checked,
      onSelected: (_) => onSelect(),
      selectedColor: checked ? Theme.of(context).colorScheme.tertiary : null,
      labelStyle: checked ? TextStyle(color: Theme.of(context).colorScheme.onTertiary) : null,
      checkmarkColor: checked ? Theme.of(context).colorScheme.onTertiary : null,
    );
  }
}
