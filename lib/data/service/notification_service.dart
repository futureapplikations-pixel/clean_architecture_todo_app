import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Service for handling local notifications for scheduled messages
class NotificationService {
  static const String _channelId = 'scheduled_messages';
  static const String _channelName = 'Scheduled Messages';
  static const String _channelDescription =
      'Notifications for scheduled messages';

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationService(this._flutterLocalNotificationsPlugin);

  /// Initialize the notification service
  Future<void> initialize() async {
    tz_data.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        // Handle notification tap
        _onNotificationTap(notificationResponse);
      },
    );

    // Create notification channel for Android
    await _createNotificationChannel();
  }

  /// Create notification channel for Android
  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.max,
      playSound: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Schedule a notification for a message
  Future<void> scheduleMessageNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  /// Cancel a scheduled notification
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  /// Cancel all scheduled notifications
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  /// Show an immediate notification (for testing)
  Future<void> showImmediateNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payload,
    );
  }

  /// Handle notification tap
  void _onNotificationTap(NotificationResponse notificationResponse) {
    // This could navigate to the specific message or perform other actions
    // For now, we'll just print the payload
    if (notificationResponse.payload != null) {
      print(
          'Notification tapped with payload: ${notificationResponse.payload}');
    }
  }

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled() async {
    final androidImplementation =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      return await androidImplementation.areNotificationsEnabled() ?? false;
    }
    return true; // Assume enabled for iOS
  }

  /// Request notification permissions
  Future<bool> requestPermissions() async {
    final androidImplementation =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      return await androidImplementation.requestNotificationsPermission() ??
          false;
    }
    return true; // Assume granted for iOS
  }
}

/// Provider for NotificationService
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final notificationService =
      NotificationService(flutterLocalNotificationsPlugin);

  // Initialize the service
  notificationService.initialize();

  return notificationService;
});
