import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';

import '../viewmodel/mementolist/memento_list_with_search.dart';
import '../widgets/actions.dart';
import '../widgets/master_detail.dart';
import 'memento_form.dart';
import '../widgets/chips_bar.dart';
import '../widgets/memento_card.dart';

class MementoListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Watch the search query provider
    final searchQuery = ref.watch(searchQueryNotifierProvider);
    final searchQueryNotifier = ref.watch(searchQueryNotifierProvider.notifier);

    // Watch the combined viewmodel with search functionality
    final mementosAsync = ref.watch(mementoListWithSearchViewModelProvider);

    return MasterDetailWidget<Memento>(
      listWidth: 400,
      items: mementosAsync.valueOrNull ?? [],
      listBuilder: (context, mementos, current, onSelect) => Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
              hintText: 'Search Mementos...',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
            onChanged: (value) {
              searchQueryNotifier.state = value;
            },
          ),
          bottom: searchQuery.isNotEmpty ? PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Found ${mementosAsync.value?.length ?? 0} results for "$searchQuery"',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ) : null,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Delete All Mementos',
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final deleteAll = await confirm(
                  context,
                  title: 'Warning',
                  content: 'Delete all mementos?',
                );
                if (deleteAll) {
                  final model = ref.watch(mementoListWithSearchViewModelProvider.notifier);
                  await model.deleteAllMementos();
                  messenger.showSnackBar(const SnackBar(content: Text('All mementos deleted')));
                }
              },
            ),
            if (searchQuery.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear),
                tooltip: 'Clear Search',
                onPressed: () {
                  searchQueryNotifier.state = '';
                },
              ),
          ],
        ),
        body: Column(
          children: [
            ChipsBarWidget(),
            Divider(height: 2, color: theme.colorScheme.outlineVariant),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (mementos.isEmpty) {
                    return const Center(child: Text('No Mementos found'));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: mementos.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => MementoCard(
                      memento: mementos[index],
                      onTap: () => onSelect(mementos[index]),
                      onEdit: () => _editMemento(context, mementos[index]),
                      onDelete: () => _deleteMemento(context, mementos[index]),
                      showActions: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push<Memento?>(
            context,
            MaterialPageRoute(
              builder: (_) => const MementoFormPage(),
            ),
          ).then(onSelect),
          tooltip: 'Add Memento',
          child: const Icon(Icons.add),
        ),
      ),
      detailBuilder: (context, memento) => MementoFormPage(
        key: ValueKey(memento),
        memento: memento,
        showSave: false,
      ),
      emptyBuilder: (_) => const Material(child: Center(child: Text('Select a Memento'))),
    );
  }

  void _editMemento(BuildContext context, Memento memento) {
    Navigator.push<Memento?>(
      context,
      MaterialPageRoute(
        builder: (_) => MementoFormPage(memento: memento),
      ),
    );
  }

  void _deleteMemento(BuildContext context, Memento memento) async {
    final confirmed = await confirm(
      context,
      title: 'Delete Memento',
      content: 'Are you sure you want to delete "${memento.name}"?',
    );

    if (confirmed) {
      // Access ref through context
      final container = ProviderScope.containerOf(context);
      final model = container.read(mementoListWithSearchViewModelProvider.notifier);
      await model.deleteMemento(memento.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${memento.name} deleted')),
      );
    }
  }
}
