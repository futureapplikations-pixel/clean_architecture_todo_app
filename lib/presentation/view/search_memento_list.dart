import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodel/mementolist/search_memento_list.dart';
import '../widgets/memento_card.dart';

class SearchMementoList extends HookConsumerWidget {
  const SearchMementoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = useState('');
    final mementos =
        ref.watch(searchMementoListViewModelProvider(search.value));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search Mementos',
            border: InputBorder.none,
          ),
          onChanged: (value) => search.value = value,
        ),
      ),
      body: mementos.when(
        data: (mementos) {
          if (mementos.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView.builder(
            itemCount: mementos.length,
            itemBuilder: (context, index) {
              final memento = mementos[index];
              return MementoCard(
                memento: memento,
                onTap: () => context.push('/memento/${memento.id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
