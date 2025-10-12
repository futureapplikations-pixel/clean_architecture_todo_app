import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/memento.dart';
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
    return database.searchMementos(query).then(MementoMapper.transformToModelList);
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
}
