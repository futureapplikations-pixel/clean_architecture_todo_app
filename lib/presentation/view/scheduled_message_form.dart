import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/model/scheduled_message.dart';

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
  ConsumerState<ScheduledMessageForm> createState() => _ScheduledMessageFormState();
}

class _ScheduledMessageFormState extends ConsumerState<ScheduledMessageForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late MessageType _selectedMessageType;
  late DateTime _scheduledDateTime;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.message?.title ?? '');
    _contentController = TextEditingController(text: widget.message?.content ?? '');
    _selectedMessageType = widget.message?.messageType ?? MessageType.sms;
    _scheduledDateTime = widget.message?.scheduledDateTime ?? DateTime.now().add(const Duration(hours: 1));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.message == null ? 'Schedule Message' : 'Edit Message'),
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
                            label: Text(DateFormat('MMM dd, yyyy').format(_scheduledDateTime)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _selectTime(context),
                            icon: const Icon(Icons.access_time),
                            label: Text(DateFormat('HH:mm').format(_scheduledDateTime)),
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
                label: Text(widget.message == null ? 'Schedule Message' : 'Update Message'),
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

      // TODO: Save the message using the use case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.message == null
                ? 'Message scheduled successfully!'
                : 'Message updated successfully!'
          ),
        ),
      );
      Navigator.of(context).pop();
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
}
