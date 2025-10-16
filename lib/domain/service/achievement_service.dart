import 'package:flutter/foundation.dart';

import '../model/achievement.dart';

abstract class AchievementService {
  Future<List<Achievement>> getAllAchievements();
  Future<List<Achievement>> getUnlockedAchievements();
  Future<Achievement?> getAchievement(String id);
  Future<void> updateProgress(AchievementRequirementType type, int value);
  Future<void> checkAndUnlockAchievements();
  Stream<List<Achievement>> watchUnlockedAchievements();
  Future<int> getTotalPoints();
  Future<void> resetAllProgress();
}

class AchievementServiceImpl implements AchievementService {
  final List<Achievement> _allAchievements = [];
  final Set<String> _unlockedAchievementIds = {};
  final Map<AchievementRequirementType, int> _currentProgress = {};

  static const String _storageKey = 'achievement_progress';
  static const String _unlockedKey = 'unlocked_achievements';

  AchievementServiceImpl() {
    _initializeAchievements();
    _loadProgress();
  }

  void _initializeAchievements() {
    _allAchievements.addAll([
      // Social Achievements
      Achievement(
        id: 'first_contact',
        name: 'First Connection',
        description: 'Add your first memento',
        category: AchievementCategory.social,
        rarity: AchievementRarity.common,
        icon: '👋',
        points: 10,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.mementosCreated,
            target: 1,
          ),
        ],
      ),
      Achievement(
        id: 'social_butterfly',
        name: 'Social Butterfly',
        description: 'Add 10 mementos',
        category: AchievementCategory.social,
        rarity: AchievementRarity.common,
        icon: '🦋',
        points: 50,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.mementosCreated,
            target: 10,
          ),
        ],
      ),
      Achievement(
        id: 'network_master',
        name: 'Network Master',
        description: 'Add 50 mementos',
        category: AchievementCategory.social,
        rarity: AchievementRarity.rare,
        icon: '🌟',
        points: 200,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.mementosCreated,
            target: 50,
          ),
        ],
      ),

      // Productivity Achievements
      Achievement(
        id: 'note_taker',
        name: 'Note Taker',
        description: 'Add your first note',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.common,
        icon: '📝',
        points: 15,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.notesAdded,
            target: 1,
          ),
        ],
      ),
      Achievement(
        id: 'knowledge_keeper',
        name: 'Knowledge Keeper',
        description: 'Add 25 notes',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.common,
        icon: '📚',
        points: 75,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.notesAdded,
            target: 25,
          ),
        ],
      ),
      Achievement(
        id: 'memory_master',
        name: 'Memory Master',
        description: 'Add 100 notes',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.epic,
        icon: '🧠',
        points: 300,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.notesAdded,
            target: 100,
          ),
        ],
      ),

      // Communication Achievements
      Achievement(
        id: 'messenger',
        name: 'Messenger',
        description: 'Send your first scheduled message',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.common,
        icon: '💌',
        points: 20,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.messagesSent,
            target: 1,
          ),
        ],
      ),
      Achievement(
        id: 'communicator',
        name: 'Communicator',
        description: 'Send 10 scheduled messages',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.common,
        icon: '📱',
        points: 100,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.messagesSent,
            target: 10,
          ),
        ],
      ),

      // Organization Achievements
      Achievement(
        id: 'organizer',
        name: 'Organizer',
        description: 'Create your first label',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.common,
        icon: '🏷️',
        points: 15,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.labelsCreated,
            target: 1,
          ),
        ],
      ),
      Achievement(
        id: 'categorization_expert',
        name: 'Categorization Expert',
        description: 'Create 10 labels',
        category: AchievementCategory.productivity,
        rarity: AchievementRarity.rare,
        icon: '🎯',
        points: 150,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.labelsCreated,
            target: 10,
          ),
        ],
      ),

      // Consistency Achievements
      Achievement(
        id: 'dedicated_user',
        name: 'Dedicated User',
        description: 'Use the app for 7 consecutive days',
        category: AchievementCategory.consistency,
        rarity: AchievementRarity.common,
        icon: '🔥',
        points: 50,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.consecutiveDays,
            target: 7,
          ),
        ],
      ),
      Achievement(
        id: 'loyal_companion',
        name: 'Loyal Companion',
        description: 'Use the app for 30 consecutive days',
        category: AchievementCategory.consistency,
        rarity: AchievementRarity.epic,
        icon: '💎',
        points: 500,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.consecutiveDays,
            target: 30,
          ),
        ],
      ),

      // Special Achievements
      Achievement(
        id: 'perfectionist',
        name: 'Perfectionist',
        description: 'Complete your profile with all details',
        category: AchievementCategory.special,
        rarity: AchievementRarity.rare,
        icon: '✨',
        points: 100,
        requirements: [
          const AchievementRequirement(
            type: AchievementRequirementType.specialActions,
            target: 1,
          ),
        ],
      ),
    ]);
  }

  @override
  Future<List<Achievement>> getAllAchievements() async {
    return _allAchievements.map((achievement) {
      final currentProgress =
          _currentProgress[achievement.requirements.first.type] ?? 0;
      return achievement.copyWith(
        progress: currentProgress,
      );
    }).toList();
  }

  @override
  Future<List<Achievement>> getUnlockedAchievements() async {
    return _allAchievements
        .where(
            (achievement) => _unlockedAchievementIds.contains(achievement.id))
        .toList();
  }

  @override
  Future<Achievement?> getAchievement(String id) async {
    final achievement = _allAchievements.where((a) => a.id == id).firstOrNull;
    if (achievement == null) return null;

    final currentProgress =
        _currentProgress[achievement.requirements.first.type] ?? 0;
    return achievement.copyWith(
      progress: currentProgress,
    );
  }

  @override
  Future<void> updateProgress(
      AchievementRequirementType type, int value) async {
    _currentProgress[type] = (_currentProgress[type] ?? 0) + value;
    await _saveProgress();
    await checkAndUnlockAchievements();
  }

  @override
  Future<void> checkAndUnlockAchievements() async {
    for (final achievement in _allAchievements) {
      if (_unlockedAchievementIds.contains(achievement.id)) continue;

      final currentProgress =
          _currentProgress[achievement.requirements.first.type] ?? 0;
      if (currentProgress >= achievement.requirements.first.target) {
        _unlockedAchievementIds.add(achievement.id);
        await _saveUnlockedAchievements();
        _notifyAchievementUnlocked(achievement);
      }
    }
  }

  @override
  Stream<List<Achievement>> watchUnlockedAchievements() {
    return Stream.value(_unlockedAchievementIds
        .map((id) => _allAchievements.where((a) => a.id == id).firstOrNull)
        .whereType<Achievement>()
        .toList());
  }

  @override
  Future<int> getTotalPoints() async {
    final achievements = _unlockedAchievementIds
        .map((id) => _allAchievements.where((a) => a.id == id).firstOrNull)
        .whereType<Achievement>();

    int totalPoints = 0;
    for (final achievement in achievements) {
      totalPoints += achievement.points;
    }
    return totalPoints;
  }

  @override
  Future<void> resetAllProgress() async {
    _currentProgress.clear();
    _unlockedAchievementIds.clear();
    await _saveProgress();
    await _saveUnlockedAchievements();
  }

  void _notifyAchievementUnlocked(Achievement achievement) {
    // This would typically trigger a notification or celebration animation
    debugPrint('🎉 Achievement Unlocked: ${achievement.name}');
  }

  Future<void> _loadProgress() async {
    // In a real implementation, this would load from SharedPreferences or similar
    // For now, we'll use in-memory storage
  }

  Future<void> _saveProgress() async {
    // In a real implementation, this would save to SharedPreferences or similar
  }

  Future<void> _saveUnlockedAchievements() async {
    // In a real implementation, this would save to SharedPreferences or similar
  }

  // Helper methods for tracking specific actions
  Future<void> onMementoCreated() async {
    await updateProgress(AchievementRequirementType.mementosCreated, 1);
  }

  Future<void> onNoteAdded() async {
    await updateProgress(AchievementRequirementType.notesAdded, 1);
  }

  Future<void> onMessageSent() async {
    await updateProgress(AchievementRequirementType.messagesSent, 1);
  }

  Future<void> onLabelCreated() async {
    await updateProgress(AchievementRequirementType.labelsCreated, 1);
  }

  Future<void> onConsecutiveDay(int days) async {
    await updateProgress(AchievementRequirementType.consecutiveDays, days);
  }
}

extension on List<Achievement> {
  Achievement? firstOrNullWhere(bool Function(Achievement) test) {
    try {
      return where(test).first;
    } catch (e) {
      return null;
    }
  }
}
