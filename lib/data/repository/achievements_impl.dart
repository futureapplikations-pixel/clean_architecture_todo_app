import 'package:clean_architecture_todo_app/data/mapper/achievement.dart';
import 'package:clean_architecture_todo_app/data/mapper/leaderboard.dart';
import 'package:clean_architecture_todo_app/data/mapper/quest.dart';
import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/achievement.dart';
import 'package:clean_architecture_todo_app/domain/model/leaderboard.dart';
import 'package:clean_architecture_todo_app/domain/model/quest.dart';
import 'package:clean_architecture_todo_app/domain/repository/achievements.dart';

class AchievementsRepositoryImpl implements AchievementsRepository {
  final AppDatabase _database;

  AchievementsRepositoryImpl(this._database);

  @override
  Future<Achievement> getAchievementById(String id) async {
    final entity = await _database.getAchievementById(id);
    return AchievementMapper.fromAchievementEntity(entity);
  }

  @override
  Future<List<Achievement>> getAchievements() async {
    final entities = await _database.getAchievements().get();
    return entities.map(AchievementMapper.fromAchievementEntity).toList();
  }

  @override
  Future<List<LeaderboardEntry>> getLeaderboard() async {
    final entities = await _database.getLeaderboard().get();
    return entities.map(LeaderboardMapper.fromLeaderboardEntity).toList();
  }

  @override
  Future<Quest> getQuestById(String id) async {
    final entity = await _database.getQuestById(id);
    return QuestMapper.fromQuestEntity(entity);
  }

  @override
  Future<List<Quest>> getQuests() async {
    final entities = await _database.getQuests().get();
    return entities.map(QuestMapper.fromQuestEntity).toList();
  }

  @override
  Future<void> updateAchievement(Achievement achievement) async {
    await _database.updateAchievement(AchievementMapper.toAchievementEntity(achievement));
  }

  @override
  Future<void> updateQuest(Quest quest) async {
    await _database.updateQuest(QuestMapper.toQuestEntity(quest));
  }
}
