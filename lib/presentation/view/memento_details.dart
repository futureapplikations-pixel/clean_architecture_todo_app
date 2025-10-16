import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../viewmodel/mementolist/memento_list.dart';
import '../widgets/scheduled_message_card.dart';
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
        final memento = mementos.value
            .firstWhereOrNull((memento) => memento.id.toString() == id);
        if (memento != null) {
          return Scaffold(
            appBar: AppBar(
              title: title,
              actions: [
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () =>
                      context.go('/scheduled-messages/create/${memento.id}'),
                ),
              ],
            ),
            body: ListView(
              children: [
                MementoFormPage(
                  key: ValueKey(memento),
                  memento: memento,
                  showSave: false,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Scheduled Messages',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                if (memento.scheduledMessages.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text('No scheduled messages for this memento.')),
                  )
                else
                  ...memento.scheduledMessages.map(
                    (message) => ScheduledMessageCard(
                      message: message,
                      onEdit: () =>
                          context.go('/scheduled-messages/edit/${message.id}'),
                      onDelete: () {
                        // TODO: Implement delete functionality
                      },
                    ),
                  ),
              ],
            ),
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
