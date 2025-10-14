import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/user_settings.dart';
import '../../domain/usecase/get_user_settings.dart';
import '../../domain/usecase/update_user_settings.dart';
import '../../domain/usecase/reset_user_settings.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  late TextEditingController _displayNameController;
  late TextEditingController _emailController;
  String? _selectedTimezone;
  DateFormatOption? _selectedDateFormat;
  ThemeModeOption? _selectedThemeMode;
  Color? _selectedAccentColor;

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(getUserSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: settingsAsync.when(
        data: (settings) {
          _displayNameController.text = settings.displayName;
          _emailController.text = settings.email;
          _selectedTimezone = settings.timezone;
          _selectedDateFormat = settings.dateFormat;
          _selectedThemeMode = settings.theme;
          _selectedAccentColor = settings.accentColor;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildProfileSettings(context, settings),
              const SizedBox(height: 24),
              _buildAppearanceSettings(context, settings),
              const SizedBox(height: 24),
              _buildNotificationSettings(context, settings),
              const SizedBox(height: 24),
              _buildLabelManagement(context, settings),
              const SizedBox(height: 24),
              _buildDataManagement(context, settings),
              const SizedBox(height: 24),
              _buildPrivacySecurity(context, settings),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildProfileSettings(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile Settings', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextField(
              controller: _displayNameController,
              decoration: const InputDecoration(labelText: 'Display Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedTimezone,
              decoration: const InputDecoration(labelText: 'Timezone'),
              items: <String>['UTC', 'America/New_York', 'Europe/London']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimezone = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<DateFormatOption>(
              value: _selectedDateFormat,
              decoration: const InputDecoration(labelText: 'Date Format'),
              items: DateFormatOption.values
                  .map<DropdownMenuItem<DateFormatOption>>((DateFormatOption value) {
                return DropdownMenuItem<DateFormatOption>(value: value, child: Text(value.name));
              }).toList(),
              onChanged: (DateFormatOption? newValue) {
                setState(() {
                  _selectedDateFormat = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _saveProfileSettings(settings),
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppearanceSettings(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appearance', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Theme', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: ThemeModeOption.values.map((mode) {
                return ChoiceChip(
                  label: Text(mode.name),
                  selected: _selectedThemeMode == mode,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedThemeMode = mode;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text('Accent Color', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [Colors.blue, Colors.green, Colors.purple, Colors.yellow, Colors.red].map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAccentColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedAccentColor == color ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSettings(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notifications', style: Theme.of(context).textTheme.headlineSmall),
            SwitchListTile(
              title: const Text('Message Reminders'),
              subtitle: const Text('Get notified when scheduled messages are due'),
              value: settings.messageReminders,
              onChanged: (value) {
                _updateSettings(settings.copyWith(messageReminders: value));
              },
            ),
            SwitchListTile(
              title: const Text('Birthday Reminders'),
              subtitle: const Text('Get notified about upcoming birthdays'),
              value: settings.birthdayReminders,
              onChanged: (value) {
                _updateSettings(settings.copyWith(birthdayReminders: value));
              },
            ),
            SwitchListTile(
              title: const Text('Achievement Notifications'),
              subtitle: const Text('Get notified when you unlock achievements'),
              value: settings.achievementNotifications,
              onChanged: (value) {
                _updateSettings(settings.copyWith(achievementNotifications: value));
              },
            ),
            SwitchListTile(
              title: const Text('Daily Quests'),
              subtitle: const Text('Get notified about new daily quests'),
              value: settings.dailyQuests,
              onChanged: (value) {
                _updateSettings(settings.copyWith(dailyQuests: value));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelManagement(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Manage Labels', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LabelManagementView()));
              },
              child: const Text('Go to Label Management'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataManagement(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data Management', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement export data
              },
              child: const Text('Export Data'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement import data
              },
              child: const Text('Import Data'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySecurity(BuildContext context, UserSettings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy & Security', style: Theme.of(context).textTheme.headlineSmall),
            SwitchListTile(
              title: const Text('Data Encryption'),
              subtitle: const Text('Encrypt all data stored locally'),
              value: settings.dataEncryption,
              onChanged: (value) {
                _updateSettings(settings.copyWith(dataEncryption: value));
              },
            ),
            SwitchListTile(
              title: const Text('Analytics'),
              subtitle: const Text('Help improve Memento by sharing anonymous usage data'),
              value: settings.analytics,
              onChanged: (value) {
                _updateSettings(settings.copyWith(analytics: value));
              },
            ),
            SwitchListTile(
              title: const Text('Auto-lock'),
              subtitle: const Text('Lock app after 15 minutes of inactivity'),
              value: settings.autoLock,
              onChanged: (value) {
                _updateSettings(settings.copyWith(autoLock: value));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement clear all data
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Clear All Data'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _resetSettings();
              },
              child: const Text('Reset Settings'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfileSettings(UserSettings settings) {
    final updatedSettings = settings.copyWith(
      displayName: _displayNameController.text,
      email: _emailController.text,
      timezone: _selectedTimezone,
      dateFormat: _selectedDateFormat,
      theme: _selectedThemeMode,
      accentColor: _selectedAccentColor,
    );
    ref.read(updateUserSettingsProvider).call(updatedSettings);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile settings saved!')),
    );
  }

  void _updateSettings(UserSettings settings) {
    ref.read(updateUserSettingsProvider).call(settings);
  }

  void _resetSettings() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text('Are you sure you want to reset all settings to default?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      ref.read(resetUserSettingsProvider).call();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings reset to default!')),
      );
    }
  }
}