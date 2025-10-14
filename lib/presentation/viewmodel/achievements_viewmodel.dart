import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/achievement.dart';
import '../../domain/model/quest.dart';
import '../../domain/model/leaderboard.dart';
import '../../domain/usecase/get_achievements.dart';
import '../../domain/usecase/get_quests.dart';
import '../../domain/usecase/get_leaderboard.dart';

class AchievementsViewModel extends StateNotifier<AsyncValue<AchievementsState>> {
  final GetAchievements _getAchievements;
  final GetQuests _getQuests;
  final GetLeaderboard _getLeaderboard;

  AchievementsViewModel(
    this._getAchievements,
    this._getQuests,
    this._getLeaderboard,
  ) : super(const AsyncValue.loading()) {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final achievements = await _getAchievements();
      final quests = await _getQuests();
      final leaderboard = await _getLeaderboard();
      state = AsyncValue.data(AchievementsState(
        achievements: achievements,
        quests: quests,
        leaderboard: leaderboard,
      ));
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AchievementsState {
  final List<Achievement> achievements;
  final List<Quest> quests;
  final List<LeaderboardEntry> leaderboard;

  AchievementsState({
    required this.achievements,
    required this.quests,
    required this.leaderboard,
  });
}

final achievementsViewModelProvider = StateNotifierProvider.autoDispose<
    AchievementsViewModel, AsyncValue<AchievementsState>>((ref) {
  final getAchievements = ref.watch(getAchievementsProvider);
  final getQuests = ref.watch(getQuestsProvider);
  final getLeaderboard = ref.watch(getLeaderboardProvider);
  return AchievementsViewModel(getAchievements, getQuests, getLeaderboard);
});
