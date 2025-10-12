import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';

import '../viewmodel/mementolist/memento_list.dart';
import '../widgets/actions.dart';
import '../widgets/master_detail.dart';
import 'search_memento_list.dart';
import 'memento_form.dart';
import '../widgets/chips_bar.dart';
import '../widgets/memento_card.dart';

class MementoListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mementos = ref.watch(mementoListViewModelProvider);
    return MasterDetailWidget<Memento>(
      listWidth: 400,
      items: mementos.valueOrNull ?? [],
      listBuilder: (context, mementos, current, onSelect) => Scaffold(
        appBar: AppBar(
          title: const Text('Memento'),
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
                  final model = ref.watch(mementoListViewModelProvider.notifier);
                  await model.deleteAllMementos();
                  messenger.showSnackBar(const SnackBar(content: Text('All mementos deleted')));
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search Mementos',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SearchMementoList(),
                ),
              ),
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
}
