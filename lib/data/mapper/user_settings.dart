import 'package:clean_architecture_todo_app/data/source/database/database.dart';
import 'package:clean_architecture_todo_app/domain/model/user_settings.dart';
import 'package:flutter/material.dart';

class UserSettingsMapper {
  static UserSettings fromUserSettingsEntity(UserSettingsEntity entity) {
    return UserSettings(
      id: entity.id,
      displayName: entity.displayName,
      email: entity.email,
      timezone: entity.timezone,
      dateFormat: DateFormatOption.values.firstWhere(
          (e) => e.toString() == 'DateFormatOption.' + entity.dateFormat),
      theme: ThemeModeOption.values.firstWhere(
          (e) => e.toString() == 'ThemeModeOption.' + entity.theme),
      accentColor: Color(entity.accentColor),
      messageReminders: entity.messageReminders,
      birthdayReminders: entity.birthdayReminders,
      achievementNotifications: entity.achievementNotifications,
      dailyQuests: entity.dailyQuests,
      dataEncryption: entity.dataEncryption,
      analytics: entity.analytics,
      autoLock: entity.autoLock,
    );
  }

  static UserSettingsEntity toUserSettingsEntity(UserSettings model) {
    return UserSettingsEntity(
      id: model.id,
      displayName: model.displayName,
      email: model.email,
      timezone: model.timezone,
      dateFormat: model.dateFormat.name,
      theme: model.theme.name,
      accentColor: model.accentColor.value,
      messageReminders: model.messageReminders,
      birthdayReminders: model.birthdayReminders,
      achievementNotifications: model.achievementNotifications,
      dailyQuests: model.dailyQuests,
      dataEncryption: model.dataEncryption,
      analytics: model.analytics,
      autoLock: model.autoLock,
    );
  }
}
