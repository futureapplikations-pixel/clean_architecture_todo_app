
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/memento.dart';
import '../viewmodel/mementolist/memento_list.dart';

class MementoFormPage extends ConsumerWidget {
  final Memento? memento;
  final bool showSave;

  const MementoFormPage({Key? key, this.memento, this.showSave = true})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(text: memento?.title);
    final contentController = TextEditingController(text: memento?.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(memento == null ? 'New Memento' : 'Edit Memento'),
        actions: [
          if (showSave)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final model = ref.read(mementoListViewModelProvider.notifier);
                  if (memento == null) {
                    model.createMemento(
                      titleController.text,
                      contentController.text,
                    );
                  } else {
                    model.updateMemento(
                      memento!.copyWith(
                        title: titleController.text,
                        content: contentController.text,
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                }
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
