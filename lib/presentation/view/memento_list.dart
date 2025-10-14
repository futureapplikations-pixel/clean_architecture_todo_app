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
    final searchFocusNode = useFocusNode();

    // Watch the search query provider
    final searchQuery = ref.watch(searchQueryNotifierProvider);
    final searchQueryNotifier = ref.watch(searchQueryNotifierProvider.notifier);

    // Watch the combined viewmodel with search functionality
    final mementosAsync = ref.watch(mementoListWithSearchViewModelProvider);

    // Auto-focus search when query is empty
    useEffect(() {
      if (searchQuery.isEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          searchFocusNode.requestFocus();
        });
      }
      return null;
    }, [searchQuery]);

    return MasterDetailWidget<Memento>(
      listWidth: 400,
      items: mementosAsync.valueOrNull ?? [],
      listBuilder: (context, mementos, current, onSelect) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
          surfaceTintColor: theme.colorScheme.surfaceTint,
          shadowColor: theme.colorScheme.shadow,
          title: Container(
            height: 44,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: TextField(
              focusNode: searchFocusNode,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(
                    Icons.search,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 20,
                        ),
                        onPressed: () {
                          searchQueryNotifier.state = '';
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      )
                    : null,
              ),
              onChanged: (value) {
                searchQueryNotifier.state = value;
              },
            ),
          ),
          bottom: searchQuery.isNotEmpty ? PreferredSize(
            preferredSize: const Size.fromHeight(32),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 16, bottom: 8),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Found ',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextSpan(
                      text: '${mementosAsync.value?.length ?? 0}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' results for ',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextSpan(
                      text: '"$searchQuery"',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ) : null,
          actions: [
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.delete_sweep,
                  color: theme.colorScheme.error,
                  size: 20,
                ),
                tooltip: 'Delete All Contacts',
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  final deleteAll = await confirm(
                    context,
                    title: 'Warning',
                    content: 'Delete all contacts? This action cannot be undone.',
                  );
                  if (deleteAll) {
                    final model = ref.watch(mementoListWithSearchViewModelProvider.notifier);
                    await model.deleteAllMementos();
                    messenger.showSnackBar(
                      SnackBar(
                        content: const Text('All contacts deleted'),
                        backgroundColor: theme.colorScheme.error,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
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
                    return _buildEmptyState(context, theme, searchQuery);
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
        floatingActionButton: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () => Navigator.push<Memento?>(
              context,
              MaterialPageRoute(
                builder: (_) => const MementoFormPage(),
              ),
            ).then(onSelect),
            tooltip: 'Add New Contact',
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
              size: 24,
            ),
          ),
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

  Widget _buildEmptyState(BuildContext context, ThemeData theme, String searchQuery) {
    if (searchQuery.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No contacts found',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search terms or add a new contact',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.push<Memento?>(
                context,
                MaterialPageRoute(
                  builder: (_) => const MementoFormPage(),
                ),
              ),
              icon: const Icon(Icons.person_add),
              label: const Text('Add Contact'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 2,
                shadowColor: theme.colorScheme.primary.withOpacity(0.3),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: theme.colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No contacts yet',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first contact to get started',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.push<Memento?>(
              context,
              MaterialPageRoute(
                builder: (_) => const MementoFormPage(),
              ),
            ),
            icon: const Icon(Icons.person_add),
            label: const Text('Add Your First Contact'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              elevation: 2,
              shadowColor: theme.colorScheme.primary.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
