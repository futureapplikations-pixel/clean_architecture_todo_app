import '../model/label.dart';

abstract class LabelsRepository {
  Future<List<Label>> getLabels();
  Future<Label?> getLabelById(int id);
  Future<Label> createLabel({
    required String name,
    required String color,
    String? description,
  });
  Future<void> updateLabel(
    int id, {
    required String name,
    required String color,
    String? description,
  });
  Future<void> deleteLabel(int id);
  Stream<List<Label>> watchLabels();
}
