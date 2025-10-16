import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/model/scheduled_message.dart';
import '../viewmodel/mementolist/memento_list_with_search.dart';
import '../viewmodel/scheduled_message_form.dart';
import '../viewmodel/scheduled_messages_list.dart';

/// Form for creating or editing scheduled messages
class ScheduledMessageForm extends ConsumerStatefulWidget {
  final ScheduledMessage? message; // null for create, existing message for edit
  final int mementoId;

  const ScheduledMessageForm({
    super.key,
    this.message,
    required this.mementoId,
  });

  @override
  ConsumerState<ScheduledMessageForm> createState() =>
      _ScheduledMessageFormState();
}

class _ScheduledMessageFormState extends ConsumerState<ScheduledMessageForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late MessageType _selectedMessageType;
  late DateTime _scheduledDateTime;
  int? _selectedMementoId;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.message?.title ?? '');
    _contentController =
        TextEditingController(text: widget.message?.content ?? '');
    _selectedMessageType = widget.message?.messageType ?? MessageType.sms;
    _scheduledDateTime = widget.message?.scheduledDateTime ??
        DateTime.now().add(const Duration(hours: 1));
    _selectedMementoId = widget.mementoId != 0 ? widget.mementoId : null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(scheduledMessageFormProvider, (previous, next) {
      next.when(
        data: (_) {
          ref.read(scheduledMessagesListViewModelProvider.notifier).refresh();
          Navigator.of(context).pop();
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $error')),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.message == null ? 'Schedule Message' : 'Edit Message'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Message type selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message Type',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: MessageType.values.map((type) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(type.displayName),
                            avatar: Icon(_getMessageTypeIcon(type)),
                            selected: _selectedMessageType == type,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() => _selectedMessageType = type);
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Memento selection (only show if mementoId is 0)
            if (widget.mementoId == 0) ...[
              _buildMementoSelection(),
              const SizedBox(height: 16),
            ],

            // Title field
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Message Title',
                hintText: 'e.g., Birthday Reminder',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Content field
            TextFormField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Message Content',
                hintText: 'Enter your message...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter message content';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Date and time selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedule Time',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _selectDate(context),
                            icon: const Icon(Icons.calendar_today),
                            label: Text(DateFormat('MMM dd, yyyy')
                                .format(_scheduledDateTime)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _selectTime(context),
                            icon: const Icon(Icons.access_time),
                            label: Text(
                                DateFormat('HH:mm').format(_scheduledDateTime)),
                          ),
                        ),
                      ],
                    ),
                    if (!_scheduledDateTime.isAfter(DateTime.now()))
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Please select a future date and time',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: Icon(widget.message == null ? Icons.send : Icons.save),
                label: Text(widget.message == null
                    ? 'Schedule Message'
                    : 'Update Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _scheduledDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _scheduledDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _scheduledDateTime.hour,
          _scheduledDateTime.minute,
        );
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_scheduledDateTime),
    );
    if (picked != null) {
      setState(() {
        _scheduledDateTime = DateTime(
          _scheduledDateTime.year,
          _scheduledDateTime.month,
          _scheduledDateTime.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_scheduledDateTime.isAfter(DateTime.now())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a future date and time')),
        );
        return;
      }

      final mementoId = _selectedMementoId;
      if (mementoId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a contact')),
        );
        return;
      }

      final notifier = ref.read(scheduledMessageFormProvider.notifier);
      if (widget.message == null) {
        notifier.addMessage(
          mementoId: mementoId,
          messageType: _selectedMessageType,
          title: _titleController.text,
          content: _contentController.text,
          scheduledDateTime: _scheduledDateTime,
        );
      } else {
        final updatedMessage = widget.message!.copyWith(
          title: _titleController.text,
          content: _contentController.text,
          messageType: _selectedMessageType,
          scheduledDateTime: _scheduledDateTime,
        );
        notifier.updateMessage(updatedMessage);
      }
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

  Widget _buildMementoSelection() {
    final mementosAsync = ref.watch(mementoListWithSearchViewModelProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            mementosAsync.when(
              data: (mementos) {
                if (mementos.isEmpty) {
                  return const Text('No contacts available');
                }
                return DropdownButtonFormField<int>(
                  value: _selectedMementoId,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Choose a contact',
                  ),
                  items: mementos.map((memento) {
                    return DropdownMenuItem(
                      value: memento.id,
                      child: Text(memento.name),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value == 0) {
                      return 'Please select a contact';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedMementoId = value;
                    });
                  },
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error loading contacts: $error'),
            ),
          ],
        ),
      ),
    );
  }
}
