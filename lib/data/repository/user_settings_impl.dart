import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';

import '../../domain/model/user_settings.dart';
import '../../domain/repository/user_settings.dart';
import '../mapper/user_settings.dart';
import '../source/database/database.dart';
import '../source/database/database_impl.dart' as db;

part 'user_settings_impl.g.dart';

@riverpod
class UserSettingsRepositoryImpl extends _$UserSettingsRepositoryImpl
    implements UserSettingsRepository {
  late final Database database = ref.read(db.databaseProvider);

  @override
  Future<UserSettings> build() {
    return getUserSettings();
  }

  @override
  Future<UserSettings> getUserSettings() async {
    final entity = await database.getUserSettings();
    if (entity == null) {
      // Return default settings if no settings are found
      return const UserSettings(
        displayName: 'Memento User',
        email: 'user@memento.app',
        timezone: 'UTC',
        dateFormat: DateFormatOption.mmddyyyy,
        theme: ThemeModeOption.light,
        accentColor: Color(0xFF87A96B), // Sage Green
        messageReminders: true,
        birthdayReminders: true,
        achievementNotifications: true,
        dailyQuests: true,
        dataEncryption: true,
        analytics: false,
        autoLock: false,
      );
    }
    return UserSettingsMapper.fromUserSettingsEntity(entity);
  }

  @override
  Future<void> updateUserSettings(UserSettings settings) async {
    if (settings.id == null) {
      await database.insertUserSettings(
        db.UserSettingsCompanion.insert(
          displayName: settings.displayName,
          email: settings.email,
          timezone: settings.timezone,
          dateFormat: settings.dateFormat.name,
          theme: settings.theme.name,
          accentColor: settings.accentColor.value,
          messageReminders: settings.messageReminders,
          birthdayReminders: settings.birthdayReminders,
          achievementNotifications: settings.achievementNotifications,
          dailyQuests: settings.dailyQuests,
          dataEncryption: settings.dataEncryption,
          analytics: settings.analytics,
          autoLock: settings.autoLock,
        ),
      );
    } else {
      await database.updateUserSettings(
        settings.id!,
        db.UserSettingsCompanion(
          displayName: db.Val(settings.displayName),
          email: db.Val(settings.email),
          timezone: db.Val(settings.timezone),
          dateFormat: db.Val(settings.dateFormat.name),
          theme: db.Val(settings.theme.name),
          accentColor: db.Val(settings.accentColor.value),
          messageReminders: db.Val(settings.messageReminders),
          birthdayReminders: db.Val(settings.birthdayReminders),
          achievementNotifications: db.Val(settings.achievementNotifications),
          dailyQuests: db.Val(settings.dailyQuests),
          dataEncryption: db.Val(settings.dataEncryption),
          analytics: db.Val(settings.analytics),
          autoLock: db.Val(settings.autoLock),
        ),
      );
    }
  }

  @override
  Future<void> resetUserSettings() async {
    // Delete all settings and let getUserSettings return defaults
    final settings = await database.getUserSettings();
    if (settings != null) {
      await database.deleteUserSettings(settings.id!);
    }
  }

  @override
  Future<String> exportData() async {
    final mementos = await database.getMementos();
    final notes = await database.getNotes();
    final scheduledMessages = await database.getScheduledMessages();
    final messageTemplates = await database.getMessageTemplates();
    final achievements = await database.getAchievements();
    final quests = await database.getQuests();
    final leaderboard = await database.getLeaderboard();
    final userSettings = await getUserSettings();

    final data = {
      'mementos': mementos.map((e) => e.toJson()).toList(),
      'notes': notes.map((e) => e.toJson()).toList(),
      'scheduledMessages': scheduledMessages.map((e) => e.toJson()).toList(),
      'messageTemplates': messageTemplates.map((e) => e.toJson()).toList(),
      'achievements': achievements.map((e) => {
        'id': e.id,
        'name': e.name,
        'description': e.description,
        'icon': e.icon,
        'category': e.category,
        'points': e.points,
        'unlocked': e.unlocked,
        'unlockedDate': e.unlockedDate?.millisecondsSinceEpoch,
        'progress': e.progress,
        'requirement': e.requirement,
        'current': e.current,
      }).toList(),
      'quests': quests.map((e) => {
        'id': e.id,
        'name': e.name,
        'description': e.description,
        'points': e.points,
        'completed': e.completed,
        'progress': e.progress,
        'requirement': e.requirement,
      }).toList(),
      'leaderboard': leaderboard.map((e) => {
        'name': e.name,
        'points': e.points,
        'level': e.level,
      }).toList(),
      'userSettings': {
        'displayName': userSettings.displayName,
        'email': userSettings.email,
        'timezone': userSettings.timezone,
        'dateFormat': userSettings.dateFormat.name,
        'theme': userSettings.theme.name,
        'accentColor': userSettings.accentColor.value,
        'messageReminders': userSettings.messageReminders,
        'birthdayReminders': userSettings.birthdayReminders,
        'achievementNotifications': userSettings.achievementNotifications,
        'dailyQuests': userSettings.dailyQuests,
        'dataEncryption': userSettings.dataEncryption,
        'analytics': userSettings.analytics,
        'autoLock': userSettings.autoLock,
      },
      'exportDate': DateTime.now().toIso8601String(),
      'version': '1.0',
    };

    return jsonEncode(data);
  }

  @override
  Future<void> importData(String data) async {
    final Map<String, dynamic> json = jsonDecode(data);

    // Clear existing data (optional, but good for a clean import)
    await database.deleteAllMementos();
    // TODO: Clear other tables as well

    // Import mementos
    final mementosData = (json['mementos'] as List).cast<Map<String, dynamic>>();
    for (final mementoJson in mementosData) {
      await database.insertMemento(db.MementosCompanion(
        name: db.Val(mementoJson['name'] as String),
        photo: db.Val(mementoJson['photo'] as String?),
        email: db.Val(mementoJson['email'] as String?),
        phone: db.Val(mementoJson['phone'] as String?),
        context: db.Val(mementoJson['context'] as String?),
        jobTitle: db.Val(mementoJson['job_title'] as String?),
        company: db.Val(mementoJson['company'] as String?),
        birthday: db.Val(mementoJson['birthday'] as int?),
      ));
    }

    // TODO: Import other data (notes, scheduled messages, templates, achievements, quests, leaderboard, user settings)
  }
}
