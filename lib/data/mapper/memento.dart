import '../../domain/model/memento.dart';
import '../../domain/model/label.dart';
import '../../domain/model/note.dart';
import '../source/database/database_impl.dart' as db;

class MementoMapper {
  static Memento transformToModel(db.Memento memento) {
    return Memento(
      id: memento.id,
      name: memento.name,
      photo: memento.photo,
      email: memento.email,
      phone: memento.phone,
      context: memento.context,
      jobTitle: memento.jobTitle,
      company: memento.company,
      birthday: memento.birthday != null ? DateTime.fromMillisecondsSinceEpoch(memento.birthday!) : null,
      labels: [], // TODO: Load labels from database
      notes: [], // TODO: Load notes from database
    );
  }

  static List<Memento> transformToModelList(List<db.Memento> mementos) {
    return mementos.map((e) => transformToModel(e)).toList();
  }

  static Label transformLabelToModel(db.Label label) {
    return Label(
      id: label.id,
      name: label.name,
      color: label.color,
    );
  }

  static List<Label> transformLabelListToModel(List<db.Label> labels) {
    return labels.map((e) => transformLabelToModel(e)).toList();
  }

  static Note transformNoteToModel(db.Note note) {
    return Note(
      id: note.id,
      mementoId: note.mementoId,
      content: note.content,
      createdAt: DateTime.fromMillisecondsSinceEpoch(note.createdAt),
      updatedAt: note.updatedAt != null ? DateTime.fromMillisecondsSinceEpoch(note.updatedAt!) : null,
      isFavorite: note.isFavorite == 1,
    );
  }

  static List<Note> transformNoteListToModel(List<db.Note> notes) {
    return notes.map((e) => transformNoteToModel(e)).toList();
  }
}
