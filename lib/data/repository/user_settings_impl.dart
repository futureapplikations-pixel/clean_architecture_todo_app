import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
