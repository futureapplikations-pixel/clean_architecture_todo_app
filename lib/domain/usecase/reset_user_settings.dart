import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/user_settings.dart';
import 'get_user_settings.dart';

class ResetUserSettings {
  final UserSettingsRepository _repository;

  ResetUserSettings(this._repository);

  Future<void> call() => _repository.resetUserSettings();
}

final resetUserSettingsProvider = Provider<ResetUserSettings>((ref) {
  final repository = ref.watch(userSettingsRepositoryProvider);
  return ResetUserSettings(repository);
});
