import 'dart:math';

import 'package:faker/faker.dart';

import '../model/scheduled_message.dart';
import '../repository/mementos.dart';
import '../repository/scheduled_messages.dart';

class CreateRandomEvents {
  final ScheduledMessagesRepository _scheduledMessagesRepository;
  final MementosRepository _mementosRepository;

  CreateRandomEvents(this._scheduledMessagesRepository, this._mementosRepository);

  Future<void> call(int count) async {
    final mementos = await _mementosRepository.getMementos();
    if (mementos.isEmpty) {
      return;
    }

    for (var i = 0; i < count; i++) {
      final memento = mementos[Random().nextInt(mementos.length)];
      final messageType = MessageType.values[Random().nextInt(MessageType.values.length)];

      await _scheduledMessagesRepository.insertScheduledMessage(
        ScheduledMessage(
          id: 0, // id will be auto-generated
          mementoId: memento.id,
          title: faker.lorem.sentence(),
          content: faker.lorem.sentences(3).join(' '),
          messageType: messageType,
          scheduledDateTime: faker.date.dateTime(minYear: 2023, maxYear: 2024),
          createdAt: DateTime.now(),
          sentAt: null,
        ),
      );
    }
  }
}
