import 'package:flutter/material.dart';
import '../../domain/model/leaderboard.dart';

class LeaderboardItem extends StatelessWidget {
  final LeaderboardEntry entry;
  final int rank;

  const LeaderboardItem({super.key, required this.entry, required this.rank});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = entry.isUser;

    return Card(
      elevation: isUser ? 4 : 1,
      shadowColor: isUser ? theme.colorScheme.primary.withOpacity(0.5) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isUser ? theme.colorScheme.primary : theme.dividerColor,
          width: isUser ? 2 : 1,
        ),
      ),
      child: ListTile(
        leading: Text(
          '#$rank',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: isUser ? theme.colorScheme.primary : null,
          ),
        ),
        title: Text(
          entry.name,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Level ${entry.level}'),
        trailing: Text(
          '${entry.points} pts',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}