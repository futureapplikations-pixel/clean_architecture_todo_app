import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final int mementoId;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isFavorite;

  const Note({
    required this.id,
    required this.mementoId,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [id, mementoId, content, createdAt, updatedAt, isFavorite];
}
