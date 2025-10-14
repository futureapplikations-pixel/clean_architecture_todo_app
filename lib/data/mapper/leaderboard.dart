import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/leaderboard.dart';

class LeaderboardMapper {
  static LeaderboardEntry fromLeaderboardEntity(LeaderboardEntity entity) {
    return LeaderboardEntry(
      name: entity.name,
      points: entity.points,
      level: entity.level,
      isUser: entity.userId == 'user', // Assuming 'user' is the current user's ID
    );
  }

  static LeaderboardEntity toLeaderboardEntity(LeaderboardEntry model) {
    return LeaderboardEntity(
      userId: model.isUser ? 'user' : model.name, // Simple mapping for now
      name: model.name,
      points: model.points,
      level: model.level,
    );
  }
}
