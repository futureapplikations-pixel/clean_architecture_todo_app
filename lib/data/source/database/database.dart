import 'database_impl.dart';

abstract class Database {
  Future<List<Memento>> searchMementos(String query);
  Future<List<Memento>> getMementos();
  Stream<List<Memento>> watchMementos();
  Future<Memento> insertMemento(MementosCompanion memento);
  Future<void> updateMemento(int id, MementosCompanion memento);
  Future<void> deleteMemento(int id);
  Future<Memento?> getMementoById(int id);
  Future<void> deleteAllMementos();

  // Label operations
  Future<List<Label>> getLabels();
  Future<Label?> getLabelById(int id);
  Future<Label> insertLabel(LabelsCompanion label);
  Future<void> updateLabel(int id, LabelsCompanion label);
  Future<void> deleteLabel(int id);
  Future<List<Label>> getLabelsForMemento(int mementoId);
  Future<void> addLabelToMemento(int mementoId, int labelId);
  Future<void> removeLabelFromMemento(int mementoId, int labelId);

  // Note operations
  Future<List<Note>> getNotes();
  Future<Note?> getNoteById(int id);
  Future<List<Note>> getNotesForMemento(int mementoId);
  Future<Note> insertNote(NotesCompanion note);
  Future<void> updateNote(int id, NotesCompanion note);
  Future<void> deleteNote(int id);
}
