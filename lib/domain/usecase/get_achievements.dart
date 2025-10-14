import 'package:clean_architecture_todo_app/data/repository/achievements_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/achievement.dart';
import '../repository/achievements.dart';
import '../../data/source/database/database.dart';

class GetAchievements {
  final AchievementsRepository _repository;

  GetAchievements(this._repository);

  Future<List<Achievement>> call() => _repository.getAchievements();
}

final getAchievementsProvider = Provider<GetAchievements>((ref) {
  final repository = ref.watch(achievementsRepositoryProvider);
  return GetAchievements(repository);
});

final achievementsRepositoryProvider = Provider<AchievementsRepository>((ref) {
  final database = ref.watch(AppDatabase.provider);
  return AchievementsRepositoryImpl(database);
});
