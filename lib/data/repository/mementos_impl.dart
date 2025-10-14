import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/memento.dart';
import '../../domain/model/label.dart';
import '../../domain/model/note.dart';
import '../../domain/repository/mementos.dart';
import '../mapper/memento.dart';
import '../source/database/database.dart';
import '../source/database/database_impl.dart' as db;

part 'mementos_impl.g.dart';

@riverpod
class MementosRepositoryImpl extends _$MementosRepositoryImpl
    implements MementosRepository {
  late final Database database = ref.read(db.databaseProvider);

  @override
  Future<Memento> createMemento({
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  }) async {
    final model = await database.insertMemento(
      db.MementosCompanion.insert(
        name: name,
        photo: db.Val(photo),
        email: db.Val(email),
        phone: db.Val(phone),
        context: db.Val(context),
        jobTitle: db.Val(jobTitle),
        company: db.Val(company),
        birthday: db.Val(birthday?.toIso8601String()),
      ),
    );
    return MementoMapper.transformToModel(model);
  }

  @override
  Future<void> deleteAllMementos() {
    return database.deleteAllMementos();
  }

  @override
  Future<void> deleteMemento(int id) {
    return database.deleteMemento(id);
  }

  @override
  Future<Memento?> getMementoById(int id) async {
    final memento = await database.getMementoById(id);
    if (memento == null) {
      return null;
    }
    return MementoMapper.transformToModel(memento);
  }

  @override
  Future<List<Memento>> getMementos() {
    return database.getMementos().then(MementoMapper.transformToModelList);
  }

  @override
  Future<List<Memento>> searchMementos(String query) {
    if (query.isEmpty) return Future.value([]);

    // For partial matches, we'll search with a wildcard at the end
    // This allows users to see results as they type
    final searchPattern = '$query*';

    return database.searchMementos(searchPattern).then((results) {
      // Sort results by relevance (shorter matches first, then alphabetically)
      final sortedResults = results.map(MementoMapper.transformToModel).toList();

      // Custom sorting for better user experience
      sortedResults.sort((a, b) {
        // Prioritize exact matches at the beginning
        final aStartsWith = a.name.toLowerCase().startsWith(query.toLowerCase());
        final bStartsWith = b.name.toLowerCase().startsWith(query.toLowerCase());

        if (aStartsWith && !bStartsWith) return -1;
        if (!aStartsWith && bStartsWith) return 1;

        // Then sort by length (shorter names first)
        final lengthCompare = a.name.length.compareTo(b.name.length);
        if (lengthCompare != 0) return lengthCompare;

        // Finally sort alphabetically
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

      return sortedResults;
    });
  }

  @override
  Future<void> updateMemento(
    int id, {
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  }) {
    return database.updateMemento(
      id,
      db.MementosCompanion(
        name: db.Val(name),
        photo: db.Val(photo),
        email: db.Val(email),
        phone: db.Val(phone),
        context: db.Val(context),
        jobTitle: db.Val(jobTitle),
        company: db.Val(company),
        birthday: db.Val(birthday?.toIso8601String()),
      ),
    );
  }
  
  @override
  Stream<List<Memento>> build() {
    return database.watchMementos().map(MementoMapper.transformToModelList);
  }

  // Label operations
  Future<List<Label>> getLabels() {
    return database.getLabels().then(MementoMapper.transformLabelListToModel);
  }

  Future<Label?> getLabelById(int id) async {
    final label = await database.getLabelById(id);
    if (label == null) {
      return null;
    }
    return MementoMapper.transformLabelToModel(label);
  }

  Future<Label> createLabel(String name, int color) async {
    final label = await database.insertLabel(
      db.LabelsCompanion.insert(
        name: name,
        color: color,
      ),
    );
    return MementoMapper.transformLabelToModel(label);
  }

  Future<void> updateLabel(int id, String name, int color) {
    return database.updateLabel(
      id,
      db.LabelsCompanion(
        name: db.Val(name),
        color: db.Val(color),
      ),
    );
  }

  Future<void> deleteLabel(int id) {
    return database.deleteLabel(id);
  }

  Future<List<Label>> getLabelsForMemento(int mementoId) {
    return database.getLabelsForMemento(mementoId).then(MementoMapper.transformLabelListToModel);
  }

  Future<void> addLabelToMemento(int mementoId, int labelId) {
    return database.addLabelToMemento(mementoId, labelId);
  }

  Future<void> removeLabelFromMemento(int mementoId, int labelId) {
    return database.removeLabelFromMemento(mementoId, labelId);
  }

  // Note operations
  Future<List<Note>> getNotes() {
    return database.getNotes().then(MementoMapper.transformNoteListToModel);
  }

  Future<Note?> getNoteById(int id) async {
    final note = await database.getNoteById(id);
    if (note == null) {
      return null;
    }
    return MementoMapper.transformNoteToModel(note);
  }

  Future<List<Note>> getNotesForMemento(int mementoId) {
    return database.getNotesForMemento(mementoId).then(MementoMapper.transformNoteListToModel);
  }

  Future<Note> createNote(int mementoId, String content, {bool isFavorite = false}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final note = await database.insertNote(
      db.NotesCompanion.insert(
        mementoId: mementoId,
        content: content,
        createdAt: now,
        updatedAt: db.Val(now),
        isFavorite: db.Val(isFavorite ? 1 : 0),
      ),
    );
    return MementoMapper.transformNoteToModel(note);
  }

  Future<void> updateNote(int id, String content, {bool? isFavorite}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await database.updateNote(
      id,
      db.NotesCompanion(
        content: db.Val(content),
        updatedAt: db.Val(now),
        isFavorite: isFavorite != null ? db.Val(isFavorite ? 1 : 0) : const db.Val.absent(),
      ),
    );
  }

  Future<void> deleteNote(int id) {
    return database.deleteNote(id);
  }
}
