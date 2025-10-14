import 'package:clean_architecture_todo_app/domain/model/user_settings.dart';

abstract class UserSettingsRepository {
  Future<UserSettings> getUserSettings();
  Future<void> updateUserSettings(UserSettings settings);
  Future<void> resetUserSettings();
  Future<String> exportData();
  Future<void> importData(String data);
}