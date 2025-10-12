import 'package:drift/drift.dart';
import 'package:flutter/material.dart';


import '../../domain/model/label.dart' as domain;
import '../source/database/database_impl.dart';


extension LabelMapper on domain.Label {
  LabelsCompanion toCompanion() => LabelsCompanion(
        id: Value(id),
        name: Value(name),
        color: Value(color.value),
      );
}


extension LabelDbMapper on Label {
  domain.Label toDomain() => domain.Label(
        id: id,
        name: name,
        color: Color(color),
      );
}
