import '../../domain/model/memento.dart';
import '../source/database/database.dart' as db;

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
      birthday: memento.birthday != null ? DateTime.parse(memento.birthday!) : null,
    );
  }

  static List<Memento> transformToModelList(List<db.Memento> mementos) {
    return mementos.map((e) => transformToModel(e)).toList();
  }
}
