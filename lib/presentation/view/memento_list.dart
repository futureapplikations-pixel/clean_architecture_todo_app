import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';
import '../viewmodel/mementolist/memento_list.dart';
import '../widgets/actions.dart';
import '../widgets/master_detail.dart';
import '../widgets/chips_bar.dart';
import '../widgets/memento_card.dart';

class MementoListPage extends ConsumerWidget {
  const MementoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mementos = ref.watch(mementoListViewModelProvider);

    return MasterDetailWidget<Memento>(
      listWidth: 400,
      items: mementos.valueOrNull ?? [],
      listBuilder: (context, mementos, current, onSelect) => Scaffold(
        appBar: AppBar(
          title: const Text('Mementos'),
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
              onPressed: () => context.go('/search'),
            ),
          ],
        ),
        body: Column(
          children: [
            const ChipsBarWidget(),
            Divider(height: 1, color: theme.colorScheme.outlineVariant),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (mementos.isEmpty) {
                    return const Center(child: Text('No Mementos found'));
                  }
                  if (constraints.maxWidth > 600) {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: mementos.length,
                      itemBuilder: (context, index) => MementoCard(
                        memento: mementos[index],
                        onTap: () => onSelect(mementos[index]),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: mementos.length,
                      itemBuilder: (context, index) => MementoCard(
                        memento: mementos[index],
                        onTap: () => onSelect(mementos[index]),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/new'),
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

class MementoFormPage extends StatelessWidget {
  final Memento? memento;
  final bool showSave;

  const MementoFormPage({Key? key, this.memento, this.showSave = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memento == null ? 'New Memento' : 'Edit Memento'),
        actions: [
          if (showSave)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // TODO: Save memento
              },
            ),
        ],
      ),
      body: const Center(
        child: Text('Memento Form'),
      ),
    );
  }
}