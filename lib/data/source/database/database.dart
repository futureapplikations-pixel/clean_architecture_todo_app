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
}
