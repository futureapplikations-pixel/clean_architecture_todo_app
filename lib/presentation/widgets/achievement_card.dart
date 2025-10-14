import 'package:flutter/material.dart';
import '../../domain/model/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const AchievementCard({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unlocked = achievement.unlocked;

    return Card(
      elevation: unlocked ? 4 : 1,
      shadowColor: unlocked ? theme.colorScheme.primary.withOpacity(0.5) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: unlocked ? theme.colorScheme.primary : theme.dividerColor,
          width: unlocked ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.shield,
              size: 40,
              color: unlocked ? theme.colorScheme.primary : theme.disabledColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    achievement.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: unlocked ? theme.colorScheme.onSurface : theme.disabledColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: unlocked ? theme.colorScheme.onSurfaceVariant : theme.disabledColor,
                    ),
                  ),
                  if (!unlocked) ...[
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: achievement.progress / 100,
                      backgroundColor: theme.dividerColor,
                      valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                    ),
                  ],
                ],
              ),
            ),
            if (unlocked) ...[
              const SizedBox(width: 16),
              const Icon(Icons.check_circle, color: Colors.green, size: 32),
            ],
          ],
        ),
      ),
    );
  }
}
