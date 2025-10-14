import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/quest.dart';
import '../repository/achievements.dart';
import 'get_achievements.dart';

class GetQuests {
  final AchievementsRepository _repository;

  GetQuests(this._repository);

  Future<List<Quest>> call() => _repository.getQuests();
}

final getQuestsProvider = Provider<GetQuests>((ref) {
  final repository = ref.watch(achievementsRepositoryProvider);
  return GetQuests(repository);
});
