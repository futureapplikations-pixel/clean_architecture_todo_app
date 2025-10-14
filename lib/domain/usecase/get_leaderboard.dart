import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/leaderboard.dart';
import '../repository/achievements.dart';
import 'get_achievements.dart';

class GetLeaderboard {
  final AchievementsRepository _repository;

  GetLeaderboard(this._repository);

  Future<List<LeaderboardEntry>> call() => _repository.getLeaderboard();
}

final getLeaderboardProvider = Provider<GetLeaderboard>((ref) {
  final repository = ref.watch(achievementsRepositoryProvider);
  return GetLeaderboard(repository);
});
