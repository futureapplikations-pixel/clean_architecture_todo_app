import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'connection/connection.dart' as impl;
import 'database.dart';

part 'database_impl.g.dart';

typedef Val<T> = Value<T>;

final databaseProvider = Provider<Database>(
  (ref) => DatabaseImpl(
    dbName: 'database.db',
    inMemory: false,
    logStatements: false,
  ),
);

@DriftDatabase(include: {'sql/schema.drift'})
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super.connect(impl.connect(
          dbName,
          inMemory: inMemory,
          logStatements: logStatements,
        ));

  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  @override
  Stream<List<Memento>> watchMementos() => _getMementos().watch();

  @override
  Future<List<Memento>> getMementos() => _getMementos().get();

  @override
  Future<Memento?> getMementoById(int id) =>
      _getMementoById(id).getSingleOrNull();

  @override
  Future<void> deleteMemento(int id) => _deleteMemento(id);

  @override
  Future<Memento> insertMemento(MementosCompanion memento) async {
    final id = await _insertMemento(
      memento.name.value,
      memento.photo.value,
      memento.email.value,
      memento.phone.value,
      memento.context.value,
      memento.jobTitle.value,
      memento.company.value,
      memento.birthday.value,
    );
    return _getMementoById(id).getSingle();
  }

  @override
  Future<void> updateMemento(int id, MementosCompanion memento) async {
    return transaction(() {
      return _updateMemento(
        memento.name.value,
        memento.photo.value,
        memento.email.value,
        memento.phone.value,
        memento.context.value,
        memento.jobTitle.value,
        memento.company.value,
        memento.birthday.value,
        id,
      );
    });
  }

  @override
  Future<void> deleteAllMementos() {
    return transaction(() {
      return _deleteAllMementos();
    });
  }

  @override
  Future<List<Memento>> searchMementos(String query) {
    return _searchMementos(query)
        .get()
        .then((value) => value.map((e) => e.result).toList());
  }

  // Label operations
  @override
  Future<List<Label>> getLabels() => _getLabels().get();

  @override
  Future<Label?> getLabelById(int id) => _getLabelById(id).getSingleOrNull();

  @override
  Future<Label> insertLabel(LabelsCompanion label) async {
    final id = await _insertLabel(
      label.name.value,
      label.color.value,
    );
    return _getLabelById(id).getSingle();
  }

  @override
  Future<void> updateLabel(int id, LabelsCompanion label) async {
    await _updateLabel(
      label.name.value,
      label.color.value,
      id,
    );
  }

  @override
  Future<void> deleteLabel(int id) => _deleteLabel(id);

  @override
  Future<List<Label>> getLabelsForMemento(int mementoId) {
    return _getLabelsForMemento(mementoId).get();
  }

  @override
  Future<void> addLabelToMemento(int mementoId, int labelId) {
    return _addLabelToMemento(mementoId, labelId);
  }

  @override
  Future<void> removeLabelFromMemento(int mementoId, int labelId) {
    return _removeLabelFromMemento(mementoId, labelId);
  }

  // Note operations
  @override
  Future<List<Note>> getNotes() => _getNotes().get();

  @override
  Future<Note?> getNoteById(int id) => _getNoteById(id).getSingleOrNull();

  @override
  Future<List<Note>> getNotesForMemento(int mementoId) {
    return _getNotesForMemento(mementoId).get();
  }

  @override
  Future<Note> insertNote(NotesCompanion note) async {
    final id = await _insertNote(
      note.mementoId.value,
      note.content.value,
      note.createdAt.value,
      note.updatedAt.value,
      note.isFavorite.value,
    );
    return _getNoteById(id).getSingle();
  }

  @override
  Future<void> updateNote(int id, NotesCompanion note) async {
    await _updateNote(
      note.content.value,
      note.updatedAt.value,
      note.isFavorite.value,
      id,
    );
  }

  @override
  Future<void> deleteNote(int id) => _deleteNote(id);

  // Scheduled Message operations
  @override
  Future<List<ScheduledMessage>> getScheduledMessages() =>
      _getScheduledMessages().get();

  @override
  Future<ScheduledMessage?> getScheduledMessageById(int id) =>
      _getScheduledMessageById(id).getSingleOrNull();

  @override
  Future<List<ScheduledMessage>> getScheduledMessagesForMemento(int mementoId) {
    return _getScheduledMessagesForMemento(mementoId).get();
  }

  @override
  Future<List<ScheduledMessage>> getActiveScheduledMessages() {
    return _getActiveScheduledMessages().get();
  }

  @override
  Future<List<ScheduledMessage>> getDueScheduledMessages(DateTime currentTime) {
    return _getDueScheduledMessages(currentTime.millisecondsSinceEpoch).get();
  }

  @override
  Future<ScheduledMessage> insertScheduledMessage(
      ScheduledMessagesCompanion scheduledMessage) async {
    final id = await _insertScheduledMessage(
      scheduledMessage.mementoId.value,
      scheduledMessage.messageType.value,
      scheduledMessage.title.value,
      scheduledMessage.content.value,
      scheduledMessage.scheduledDateTime.value,
      scheduledMessage.isActive.value,
      scheduledMessage.createdAt.value,
      scheduledMessage.sentAt.value,
    );
    return _getScheduledMessageById(id).getSingle();
  }

  @override
  Future<void> updateScheduledMessage(
      int id, ScheduledMessagesCompanion scheduledMessage) async {
    await _updateScheduledMessage(
      scheduledMessage.mementoId.value,
      scheduledMessage.messageType.value,
      scheduledMessage.title.value,
      scheduledMessage.content.value,
      scheduledMessage.scheduledDateTime.value,
      scheduledMessage.isActive.value,
      scheduledMessage.sentAt.value,
      id,
    );
  }

  @override
  Future<void> deleteScheduledMessage(int id) => _deleteScheduledMessage(id);

  @override
  Future<void> markScheduledMessageAsSent(int id, DateTime sentAt) {
    return _markScheduledMessageAsSent(sentAt.millisecondsSinceEpoch, id);
  }
}
