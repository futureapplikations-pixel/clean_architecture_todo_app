import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/message_template.dart';
import '../../domain/usecase/get_message_templates.dart';

class MessageTemplateListView extends ConsumerWidget {
  const MessageTemplateListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageTemplatesAsync = ref.watch(getMessageTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Templates'),
      ),
      body: messageTemplatesAsync.when(
        data: (templates) {
          if (templates.isEmpty) {
            return const Center(
              child: Text('No message templates yet.'),
            );
          }
          return ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(template.name),
                  subtitle: Text(template.content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // TODO: Implement delete functionality
                    },
                  ),
                  onTap: () {
                    // TODO: Implement edit functionality
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
