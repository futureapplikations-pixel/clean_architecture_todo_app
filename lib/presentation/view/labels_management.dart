import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/label.dart';
import '../widgets/actions.dart';

class LabelsManagementPage extends HookConsumerWidget {
  const LabelsManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final labelsAsync = ref.watch(labelsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Labels'),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Label',
            onPressed: () {
              final container = ProviderScope.containerOf(context);
              _showAddLabelDialog(context, container);
            },
          ),
        ],
      ),
      body: labelsAsync.when(
        data: (labels) {
          if (labels.isEmpty) {
            return _buildEmptyState(context, theme);
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: labels.length,
            itemBuilder: (context, index) {
              final label = labels[index];
              return _LabelCard(
                label: label,
                onEdit: () => _showEditLabelDialog(context, ref, label),
                onDelete: () => _deleteLabel(context, ref, label),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.label_outline,
            size: 64,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'No labels yet',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create labels to organize your contacts',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Access ref through context
              final container = ProviderScope.containerOf(context);
              _showAddLabelDialog(context, container);
            },
            icon: const Icon(Icons.add),
            label: const Text('Create Your First Label'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              elevation: 2,
              shadowColor: theme.colorScheme.primary.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddLabelDialog(BuildContext context, ProviderContainer container) {
    _showLabelDialog(context, container, null);
  }

  void _showEditLabelDialog(BuildContext context, WidgetRef ref, Label label) {
    _showLabelDialog(context, ref, label);
  }

  void _showLabelDialog(BuildContext context, dynamic ref, Label? label) {
    final isEditing = label != null;
    final nameController = TextEditingController(text: label?.name ?? '');
    final descriptionController = TextEditingController(text: label?.description ?? '');
    final selectedColor = useState(label?.color ?? Label.getColorForIndex(0));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Label' : 'Add Label'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Label Name',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Text(
              'Choose Color',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                Label.colorPalette.length,
                (index) => GestureDetector(
                  onTap: () {
                    selectedColor.value = Label.colorPalette[index];
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(int.parse(Label.colorPalette[index].replaceFirst('#', '0xff'))),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColor.value == Label.colorPalette[index]
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty) return;

              final viewModel = ref.read(labelsViewModelProvider.notifier);

              if (isEditing) {
                await viewModel.updateLabel(
                  label!.id,
                  name: nameController.text.trim(),
                  color: selectedColor.value,
                  description: descriptionController.text.trim().isEmpty
                      ? null
                      : descriptionController.text.trim(),
                );
              } else {
                await viewModel.createLabel(
                  name: nameController.text.trim(),
                  color: selectedColor.value,
                  description: descriptionController.text.trim().isEmpty
                      ? null
                      : descriptionController.text.trim(),
                );
              }

              Navigator.pop(context);
            },
            child: Text(isEditing ? 'Update' : 'Create'),
          ),
        ],
      ),
    );
  }

  void _deleteLabel(BuildContext context, WidgetRef ref, Label label) async {
    final confirmed = await confirm(
      context,
      title: 'Delete Label',
      content: 'Are you sure you want to delete "${label.name}"? This will remove it from all contacts.',
    );

    if (confirmed) {
      final viewModel = ref.read(labelsViewModelProvider.notifier);
      await viewModel.deleteLabel(label.id);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Label "${label.name}" deleted')),
      );
    }
  }
}

class _LabelCard extends StatelessWidget {
  const _LabelCard({
    required this.label,
    required this.onEdit,
    required this.onDelete,
  });

  final Label label;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      shadowColor: theme.colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(int.parse(label.color.replaceFirst('#', '0xff'))),
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.outline,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  if (label.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      label.description!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    onEdit();
                    break;
                  case 'delete':
                    onDelete();
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 18),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 18, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
