import 'package:flutter/animation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

  static final LocalNotificationService _instance = LocalNotificationService._internal();
  factory LocalNotificationService() => _instance;
  LocalNotificationService._internal();


  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();




  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('icon');

      // 2️⃣ iOS / macOS (Darwin)
  final darwinSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    // onDidReceiveLocalNotification: ...  // optional callback
  );

    final InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings , 
    iOS: darwinSettings
    
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);


    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }


  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'main_channel',
      'Operation',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: 'icon',
      color: Color(0xFF0047AB),
    );

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
}
