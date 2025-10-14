import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/model/scheduled_message.dart';

/// Widget for displaying a scheduled message in a card format
class ScheduledMessageCard extends StatelessWidget {
  final ScheduledMessage message;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onMarkAsSent;

  const ScheduledMessageCard({
    super.key,
    required this.message,
    this.onEdit,
    this.onDelete,
    this.onMarkAsSent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDue = message.isDue;
    final isSent = message.isSent;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with message type and status
            Row(
              children: [
                // Message type icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getMessageTypeColor(message.messageType).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getMessageTypeIcon(message.messageType),
                    color: _getMessageTypeColor(message.messageType),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                // Title and type
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message.messageType.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(isSent, isDue).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getStatusColor(isSent, isDue),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _getStatusText(isSent, isDue),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: _getStatusColor(isSent, isDue),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Content preview
            Text(
              message.content,
              style: theme.textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Scheduled time and created time
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: theme.colorScheme.outline,
                ),
                const SizedBox(width: 4),
                Text(
                  'Scheduled: ${DateFormat('MMM dd, yyyy - HH:mm').format(message.scheduledDateTime)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                const Spacer(),
                Text(
                  'Created: ${DateFormat('MMM dd').format(message.createdAt)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),

            // Action buttons
            if (onEdit != null || onDelete != null || onMarkAsSent != null)
              const SizedBox(height: 16),
            if (onEdit != null || onDelete != null || onMarkAsSent != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onMarkAsSent != null && !isSent)
                    TextButton.icon(
                      onPressed: onMarkAsSent,
                      icon: const Icon(Icons.check_circle_outline, size: 18),
                      label: const Text('Mark Sent'),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                    ),
                  if (onEdit != null)
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text('Edit'),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                    ),
                  if (onDelete != null)
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_outline, size: 18),
                      label: const Text('Delete'),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Color _getMessageTypeColor(MessageType type) {
    switch (type) {
      case MessageType.sms:
        return Colors.green;
      case MessageType.email:
        return Colors.blue;
      case MessageType.whatsapp:
        return Colors.green.shade600;
    }
  }

  IconData _getMessageTypeIcon(MessageType type) {
    switch (type) {
      case MessageType.sms:
        return Icons.sms;
      case MessageType.email:
        return Icons.email;
      case MessageType.whatsapp:
        return Icons.chat;
    }
  }

  Color _getStatusColor(bool isSent, bool isDue) {
    if (isSent) return Colors.grey;
    if (isDue) return Colors.orange;
    return Colors.green;
  }

  String _getStatusText(bool isSent, bool isDue) {
    if (isSent) return 'Sent';
    if (isDue) return 'Due';
    return 'Scheduled';
  }
}
