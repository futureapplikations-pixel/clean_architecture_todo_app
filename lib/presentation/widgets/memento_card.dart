import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';
import '../viewmodel/mementolist/memento_list.dart';

class MementoCard extends ConsumerWidget {
  const MementoCard({
    Key? key,
    required this.memento,
    this.onTap,
  }) : super(key: key);

  final Memento memento;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(memento.title.substring(0, 1)),
          ),
          title: Text(
            memento.title,
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Text(
            memento.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
            onSelected: (value) {
              if (value == 'edit') {
                context.go('/memento/${memento.id}');
              } else if (value == 'delete') {
                final model = ref.read(mementoListViewModelProvider.notifier);
                model.deleteMemento(memento.id);
              }
            },
          ),
        ),
      ),
    );
  }
}