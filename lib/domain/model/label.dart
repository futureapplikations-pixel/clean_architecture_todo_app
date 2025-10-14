import 'package:equatable/equatable.dart';

class Label extends Equatable {
  final int id;
  final String name;
  final int color;

  const Label({
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, color];
}
