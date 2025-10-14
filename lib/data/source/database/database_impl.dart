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
  Future<Memento?> getMementoById(int id) => _getMementoById(id).getSingleOrNull();

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
    return _searchMementos(query).get().then((value) => value.map((e) => e.result).toList());
  }

  @override
  Future<List<Label>> getLabels() {
    return _getLabels().get();
  }

  @override
  Stream<List<Label>> watchLabels() {
    return _getLabels().watch();
  }

  @override
  Future<Label> insertLabel(LabelsCompanion label) async {
    final id = await _insertLabel(
      label.name.value,
      label.color.value,
      label.createdAt.value ?? DateTime.now().toIso8601String(),
      label.description.value,
    );
    return _getLabelById(id).getSingle();
  }

  @override
  Future<void> updateLabel(int id, LabelsCompanion label) async {
    await _updateLabel(
      label.name.value,
      label.color.value,
      label.description.value,
      id,
    );
  }

  @override
  Future<void> deleteLabel(int id) {
    return _deleteLabel(id);
  }

  @override
  Future<Label?> getLabelById(int id) async {
    final label = await _getLabelById(id).getSingleOrNull();
    return label;
  }
}
