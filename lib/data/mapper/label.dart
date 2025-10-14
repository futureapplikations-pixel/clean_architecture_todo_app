import 'package:drift/drift.dart';

import '../../domain/model/label.dart' as domain;
import '../source/database/database_impl.dart';

extension LabelMapper on domain.Label {
  static LabelsCompanion toCompanion(domain.Label label) => LabelsCompanion(
        id: Value(label.id),
        name: Value(label.name),
        color: Value(label.color),
        createdAt: Value(label.createdAt.toIso8601String()),
        description: Value(label.description),
      );
}

extension LabelDbMapper on Label {
  static domain.Label transformToModel(Label label) => domain.Label(
        id: label.id,
        name: label.name,
        color: label.color,
        createdAt: DateTime.parse(label.createdAt),
        description: label.description,
      );

  static List<domain.Label> transformToModelList(List<Label> labels) =>
      labels.map(transformToModel).toList();
}
