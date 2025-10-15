import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/label.dart';
import '../../data/repository/mementos_impl.dart';

class LabelManagementView extends ConsumerStatefulWidget {
  const LabelManagementView({super.key});

  @override
  ConsumerState<LabelManagementView> createState() => _LabelManagementViewState();
}

class _LabelManagementViewState extends ConsumerState<LabelManagementView> {
  late final TextEditingController _labelNameController;
  Color _selectedColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _labelNameController = TextEditingController();
  }

  @override
  void dispose() {
    _labelNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mementosRepo = ref.watch(mementosRepositoryImplProvider);
    final labelsAsync = mementosRepo.getLabels();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Labels'),
      ),
      body: labelsAsync.when(
        data: (labels) {
          if (labels.isEmpty) {
            return const Center(
              child: Text('No labels created yet.'),
            );
          }
          return ListView.builder(
            itemCount: labels.length,
            itemBuilder: (context, index) {
              final label = labels[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: Color(label.color)),
                  title: Text(label.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteLabel(label.id!),
                  ),
                  onTap: () => _editLabel(label),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addLabel(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addLabel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Label'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _labelNameController,
              decoration: const InputDecoration(labelText: 'Label Name'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [Colors.blue, Colors.green, Colors.purple, Colors.yellow, Colors.red].map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColor == color ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_labelNameController.text.isNotEmpty) {
                await ref.read(mementosRepositoryImplProvider).createLabel(
                      _labelNameController.text,
                      _selectedColor.value,
                    );
                _labelNameController.clear();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _editLabel(Label label) {
    _labelNameController.text = label.name;
    _selectedColor = Color(label.color);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Label'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _labelNameController,
              decoration: const InputDecoration(labelText: 'Label Name'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [Colors.blue, Colors.green, Colors.purple, Colors.yellow, Colors.red].map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColor == color ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_labelNameController.text.isNotEmpty) {
                await ref.read(mementosRepositoryImplProvider).updateLabel(
                      label.id!,
                      _labelNameController.text,
                      _selectedColor.value,
                    );
                _labelNameController.clear();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteLabel(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Label'),
        content: const Text('Are you sure you want to delete this label?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(mementosRepositoryImplProvider).deleteLabel(id);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
