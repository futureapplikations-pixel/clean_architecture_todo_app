import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/achievement.dart';
import '../repository/achievements.dart';
import '../repository/mementos.dart';
import '../repository/scheduled_messages.dart';
import '../usecase/get_achievements.dart';

class AchievementService {
  final AchievementsRepository _achievementsRepository;
  final MementosRepository _mementosRepository;
  final ScheduledMessagesRepository _scheduledMessagesRepository;

  AchievementService(
    this._achievementsRepository,
    this._mementosRepository,
    this._scheduledMessagesRepository,
  );

  Future<void> checkAndUnlockAchievements() async {
    final achievements = await _achievementsRepository.getAchievements();
    final mementos = await _mementosRepository.getMementos();
    final notes = await _mementosRepository.getNotes();
    final scheduledMessages = await _scheduledMessagesRepository.getScheduledMessages();

    for (final achievement in achievements) {
      if (!achievement.unlocked) {
        int currentProgress = achievement.current;
        switch (achievement.id) {
          case 'first-connection':
            currentProgress = mementos.isNotEmpty ? 1 : 0;
            break;
          case 'network-builder':
            currentProgress = mementos.length;
            break;
          case 'connection-master':
            currentProgress = mementos.length;
            break;
          case 'social-butterfly':
            currentProgress = mementos.length;
            break;
          case 'note-taker':
            currentProgress = notes.isNotEmpty ? 1 : 0;
            break;
          case 'memory-keeper':
            currentProgress = notes.length;
            break;
          case 'communication-expert':
            currentProgress = scheduledMessages.where((msg) => msg.sentAt != null).length;
            break;
          case 'consistent-connector':
            // TODO: Implement streak tracking
            break;
          case 'relationship-architect':
            // TODO: Implement notes to different mementos tracking
            break;
          case 'master-networker':
            // TODO: Implement total points tracking
            break;
        }

        final updatedAchievement = achievement.copyWith(
          current: currentProgress,
          progress: (currentProgress / achievement.requirement) * 100,
        );

        if (updatedAchievement.current >= updatedAchievement.requirement) {
          await _unlockAchievement(updatedAchievement);
        } else {
          await _achievementsRepository.updateAchievement(updatedAchievement);
        }
      }
    }
  }

  Future<void> _unlockAchievement(Achievement achievement) async {
    final unlockedAchievement = achievement.copyWith(
      unlocked: true,
      unlockedDate: DateTime.now(),
      progress: 100,
    );
    await _achievementsRepository.updateAchievement(unlockedAchievement);
    // TODO: Show a notification or animation for unlocked achievement
  }
}

final achievementServiceProvider = Provider<AchievementService>((ref) {
  final achievementsRepository = ref.watch(achievementsRepositoryProvider);
  final mementosRepository = ref.watch(mementosRepositoryImplProvider);
  final scheduledMessagesRepository = ref.watch(scheduledMessagesRepositoryImplProvider);
  return AchievementService(
    achievementsRepository,
    mementosRepository,
    scheduledMessagesRepository,
  );
});
