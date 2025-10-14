import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_settings.dart';
import '../repository/user_settings.dart';
import 'get_user_settings.dart';

class UpdateUserSettings {
  final UserSettingsRepository _repository;

  UpdateUserSettings(this._repository);

  Future<void> call(UserSettings settings) => _repository.updateUserSettings(settings);
}

final updateUserSettingsProvider = Provider<UpdateUserSettings>((ref) {
  final repository = ref.watch(userSettingsRepositoryProvider);
  return UpdateUserSettings(repository);
});
