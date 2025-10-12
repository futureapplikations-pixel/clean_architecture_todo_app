import '../model/memento.dart';

abstract class MementosRepository {
  Future<List<Memento>> searchMementos(String query);

  Future<List<Memento>> getMementos();

  Future<Memento?> getMementoById(int id);

  Future<Memento> createMemento({
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  });

  Future<void> updateMemento(
    final int id, {
    required String name,
    String? photo,
    String? email,
    String? phone,
    String? context,
    String? jobTitle,
    String? company,
    DateTime? birthday,
  });

  Future<void> deleteMemento(final int id);

  Future<void> deleteAllMementos();
}
