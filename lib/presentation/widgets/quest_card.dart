import 'package:flutter/material.dart';
import '../../domain/model/quest.dart';

class QuestCard extends StatelessWidget {
  final Quest quest;

  const QuestCard({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completed = quest.completed;

    return Card(
      elevation: completed ? 0 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: completed ? Colors.green : theme.dividerColor,
          width: completed ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.flag,
              size: 40,
              color: completed ? Colors.green : theme.colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quest.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: quest.progress / quest.requirement,
                    backgroundColor: theme.dividerColor,
                    valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '+${quest.points} pts',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}