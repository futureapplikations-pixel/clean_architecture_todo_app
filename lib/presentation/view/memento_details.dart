import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/mementolist/memento_list.dart';
import 'memento_form.dart';

class MementoDetails extends ConsumerWidget {
  const MementoDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mementos = ref.watch(mementoListViewModelProvider);
    const Widget title = Text('Memento Details');
    return mementos.map(
      loading: (_) => Scaffold(
        appBar: AppBar(title: title),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error) => Scaffold(
        appBar: AppBar(title: title),
        body: Center(child: Text('Error loading Memento: $error')),
      ),
      data: (mementos) {
        final memento = mementos.value.firstWhereOrNull((memento) => memento.id.toString() == id);
        if (memento != null) {
          return MementoFormPage(
            key: ValueKey(memento),
            memento: memento,
            showSave: false,
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: title),
            body: Center(
              child: Text(
                'Memento not found',
                style: theme.textTheme.titleLarge,
              ),
            ),
          );
        }
      },
    );
  }
}
