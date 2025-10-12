import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';
import '../utils/constants.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memento.name,
                style: theme.textTheme.titleMedium,
              ),
              if (memento.company != null) ...[
                const SizedBox(height: 8),
                Text(
                  memento.company!,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
