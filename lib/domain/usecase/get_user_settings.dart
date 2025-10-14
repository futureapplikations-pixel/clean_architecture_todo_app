import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_settings.dart';
import '../repository/user_settings.dart';
import '../../data/repository/user_settings_impl.dart';

class GetUserSettings {
  final UserSettingsRepository _repository;

  GetUserSettings(this._repository);

  Future<UserSettings> call() => _repository.getUserSettings();
}

final getUserSettingsProvider = Provider<GetUserSettings>((ref) {
  final repository = ref.watch(userSettingsRepositoryProvider);
  return GetUserSettings(repository);
});

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepositoryImpl(ref);
});
