import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodel/scheduled_messages_list.dart';
import '../widgets/scheduled_message_card.dart';
import '../../domain/model/scheduled_message.dart';

/// Screen for displaying a list of scheduled messages
class ScheduledMessagesListView extends ConsumerStatefulWidget {
  const ScheduledMessagesListView({super.key});

  @override
  ConsumerState<ScheduledMessagesListView> createState() =>
      _ScheduledMessagesListViewState();
}

class _ScheduledMessagesListViewState
    extends ConsumerState<ScheduledMessagesListView> {
  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(scheduledMessagesListViewModelProvider);
    final viewModel =
        ref.watch(scheduledMessagesListViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Messages'),
        actions: [
          // Filter menu
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'all':
                  viewModel.refresh();
                  break;
                case 'active':
                  viewModel.loadActiveOnly();
                  break;
                case 'due':
                  viewModel.loadDueMessages();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'all',
                child: Text('All Messages'),
              ),
              const PopupMenuItem(
                value: 'active',
                child: Text('Active Only'),
              ),
              const PopupMenuItem(
                value: 'due',
                child: Text('Due Now'),
              ),
            ],
          ),
          // Refresh button
          IconButton(
            onPressed: () => viewModel.refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: messages.isEmpty
          ? _buildEmptyState()
          : _buildMessagesList(context, messages, viewModel),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToCreateForm(context),
        icon: const Icon(Icons.add),
        label: const Text('Schedule Message'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_send,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'No scheduled messages',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Schedule your first message to get started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _navigateToCreateForm(context),
            icon: const Icon(Icons.add),
            label: const Text('Schedule Message'),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(
      BuildContext context,
      List<ScheduledMessage> messages,
      ScheduledMessagesListViewModel viewModel) {
    final dueMessages = messages.where((m) => m.isDue).toList();
    final scheduledMessages =
        messages.where((m) => !m.isDue && !m.isSent).toList();
    final sentMessages = messages.where((m) => m.isSent).toList();

    return ListView(
      children: [
        if (dueMessages.isNotEmpty)
          _buildMessageSection(context, 'Due', dueMessages, viewModel),
        if (scheduledMessages.isNotEmpty)
          _buildMessageSection(
              context, 'Scheduled', scheduledMessages, viewModel),
        if (sentMessages.isNotEmpty)
          _buildMessageSection(context, 'Sent', sentMessages, viewModel),
      ],
    );
  }

  Widget _buildMessageSection(
      BuildContext context,
      String title,
      List<ScheduledMessage> messages,
      ScheduledMessagesListViewModel viewModel) {
    return ExpansionTile(
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      initiallyExpanded: true,
      children: messages
          .map((message) => ScheduledMessageCard(
                message: message,
                onEdit: () => _navigateToEditForm(context, message),
                onDelete: () =>
                    _showDeleteConfirmation(context, viewModel, message),
                onMarkAsSent: message.isSent
                    ? null
                    : () => _markAsSent(context, viewModel, message),
              ))
          .toList(),
    );
  }

  void _navigateToCreateForm(BuildContext context) {
    // Navigate to create form without mementoId - form will handle selection
    context.go('/scheduled-messages/create/0');
  }

  void _navigateToEditForm(BuildContext context, ScheduledMessage message) {
    context.go('/scheduled-messages/edit/${message.id}');
  }

  void _showDeleteConfirmation(BuildContext context,
      ScheduledMessagesListViewModel viewModel, ScheduledMessage message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Message'),
        content: Text('Are you sure you want to delete "${message.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              viewModel.deleteMessage(message.id!);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Deleted "${message.title}"')),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _markAsSent(BuildContext context,
      ScheduledMessagesListViewModel viewModel, ScheduledMessage message) {
    viewModel.markMessageAsSent(message.id!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marked "${message.title}" as sent')),
    );
  }
}


