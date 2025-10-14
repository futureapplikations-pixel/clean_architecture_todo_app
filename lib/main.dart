import 'package:clean_architecture_todo_app/domain/service/achievement_service.dart';
import 'presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MementoApp()));

  // Check for achievements
  ProviderContainer().read(achievementServiceProvider).checkAndUnlockAchievements();
}
