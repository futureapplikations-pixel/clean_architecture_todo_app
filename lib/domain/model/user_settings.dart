import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeModeOption {
  light,
  dark,
  auto,
}

enum DateFormatOption {
  mmddyyyy,
  ddmmyyyy,
  yyyymmdd,
}

class UserSettings extends Equatable {
  final int? id;
  final String displayName;
  final String email;
  final String timezone;
  final DateFormatOption dateFormat;
  final ThemeModeOption theme;
  final Color accentColor;
  final bool messageReminders;
  final bool birthdayReminders;
  final bool achievementNotifications;
  final bool dailyQuests;
  final bool dataEncryption;
  final bool analytics;
  final bool autoLock;

  const UserSettings({
    this.id,
    required this.displayName,
    required this.email,
    required this.timezone,
    required this.dateFormat,
    required this.theme,
    required this.accentColor,
    required this.messageReminders,
    required this.birthdayReminders,
    required this.achievementNotifications,
    required this.dailyQuests,
    required this.dataEncryption,
    required this.analytics,
    required this.autoLock,
  });

  UserSettings copyWith({
    int? id,
    String? displayName,
    String? email,
    String? timezone,
    DateFormatOption? dateFormat,
    ThemeModeOption? theme,
    Color? accentColor,
    bool? messageReminders,
    bool? birthdayReminders,
    bool? achievementNotifications,
    bool? dailyQuests,
    bool? dataEncryption,
    bool? analytics,
    bool? autoLock,
  }) {
    return UserSettings(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      timezone: timezone ?? this.timezone,
      dateFormat: dateFormat ?? this.dateFormat,
      theme: theme ?? this.theme,
      accentColor: accentColor ?? this.accentColor,
      messageReminders: messageReminders ?? this.messageReminders,
      birthdayReminders: birthdayReminders ?? this.birthdayReminders,
      achievementNotifications: achievementNotifications ?? this.achievementNotifications,
      dailyQuests: dailyQuests ?? this.dailyQuests,
      dataEncryption: dataEncryption ?? this.dataEncryption,
      analytics: analytics ?? this.analytics,
      autoLock: autoLock ?? this.autoLock,
    );
  }

  @override
  List<Object?> get props => [
        id,
        displayName,
        email,
        timezone,
        dateFormat,
        theme,
        accentColor,
        messageReminders,
        birthdayReminders,
        achievementNotifications,
        dailyQuests,
        dataEncryption,
        analytics,
        autoLock,
      ];
}
