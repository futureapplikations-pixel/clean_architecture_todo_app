import '../../domain/model/achievement.dart';
import '../../domain/model/quest.dart';
import '../../domain/model/leaderboard.dart';

abstract class AchievementsRepository {
  Future<List<Achievement>> getAchievements();
  Future<Achievement> getAchievementById(String id);
  Future<void> updateAchievement(Achievement achievement);

  Future<List<Quest>> getQuests();
  Future<Quest> getQuestById(String id);
  Future<void> updateQuest(Quest quest);

  Future<List<LeaderboardEntry>> getLeaderboard();
}
