import 'package:equatable/equatable.dart';

class Label extends Equatable {
  const Label({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    this.description,
  });

  final int id;
  final String name;
  final String color; // Hex color code like '#FF5733'
  final DateTime createdAt;
  final String? description;

  Label copyWith({
    int? id,
    String? name,
    String? color,
    DateTime? createdAt,
    String? description,
  }) {
    return Label(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [id, name, color, createdAt, description];

  // Predefined color palette for labels
  static const List<String> colorPalette = [
    '#FF5733', // Red-Orange
    '#33FF57', // Green
    '#3357FF', // Blue
    '#FF33F1', // Magenta
    '#F1FF33', // Yellow
    '#FF8C33', // Orange
    '#8C33FF', // Purple
    '#33FFF1', // Cyan
    '#FF3333', // Red
    '#33FF8C', // Mint
  ];

  static String getColorForIndex(int index) {
    return colorPalette[index % colorPalette.length];
  }
}
