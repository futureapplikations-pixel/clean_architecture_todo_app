import 'package:equatable/equatable.dart';

class Memento extends Equatable {
  final int id;
  final String name;
  final String? photo;
  final String? email;
  final String? phone;
  final String? context;
  final String? jobTitle;
  final String? company;
  final DateTime? birthday;

  const Memento({
    required this.id,
    required this.name,
    this.photo,
    this.email,
    this.phone,
    this.context,
    this.jobTitle,
    this.company,
    this.birthday,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        photo,
        email,
        phone,
        context,
        jobTitle,
        company,
        birthday,
      ];
}
