import 'package:equatable/equatable.dart';

class LeaderboardEntry extends Equatable {
  final String name;
  final int points;
  final int level;
  final bool isUser;

  const LeaderboardEntry({
    required this.name,
    required this.points,
    required this.level,
    required this.isUser,
  });

  @override
  List<Object?> get props => [name, points, level, isUser];
}
