import 'package:equatable/equatable.dart';

import 'label.dart';
import 'note.dart';
import 'scheduled_message.dart';

class Memento extends Equatable {
  final int id;
  final String name;
  final String? photo;
  final String? email;
  final String? phone;
  final String? context;
  final String? jobTitle;
  final String? company;
  final DateTime? birthday;
  final List<Label> labels;
  final List<Note> notes;
  final List<ScheduledMessage> scheduledMessages;

  const Memento({
    required this.id,
    required this.name,
    this.photo,
    this.email,
    this.phone,
    this.context,
    this.jobTitle,
    this.company,
    this.birthday,
    this.labels = const [],
    this.notes = const [],
    this.scheduledMessages = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        photo,
        email,
        phone,
        context,
        jobTitle,
        company,
        birthday,
        labels,
        notes,
        scheduledMessages,
      ];
}
