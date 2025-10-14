import 'package:equatable/equatable.dart';

class MessageTemplate extends Equatable {
  final int? id;
  final String name;
  final String content;
  final String category;

  const MessageTemplate({
    this.id,
    required this.name,
    required this.content,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, content, category];
}
