// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:silah_app/firebase_options.dart';

import 'received_notification.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupFlutterNotifications();
  showFlutterNotification(message);
  // FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //   saveNotification(message: message);
  // });

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
}

// Create the receive port

@pragma('vm:entry-point')
void notificationTapBackground(
  NotificationResponse notificationResponse,
) async {
  // ignore: avoid_print
  //await di.init();

  print(
    'notification (${notificationResponse.id}) action tapped: '
    '${notificationResponse.actionId} with'
    ' payload: ${notificationResponse.payload}',
  );
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
      'notificationTag action tapped with input: ${notificationResponse.input}',
    );
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  channel = AndroidNotificationChannel(
    '1401', // id
    'App Notifications', // title
    description:
        'This channel is used for orders and products notifications.', // description
    importance: Importance.max,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final DarwinInitializationSettings
  initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,

    // onDidReceiveLocalNotification:
    //     (int id, String? title, String? body, String? payload) async {
    //   print(
    //       "onTapData onDidReceiveLocalNotification  id = $id , title = $title , body = $body , payload = $payload");

    //   didReceiveLocalNotificationStream.add(
    //     ReceivedNotification(
    //       id: id,
    //       title: title,
    //       body: body,
    //       payload: payload,
    //     ),
    //   );
    // },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
          print(
            "onTapData onDidReceiveNotificationResponse  id = ${notificationResponse.id} , actionId = ${notificationResponse.actionId} , input = ${notificationResponse.input} , payload = ${notificationResponse.payload} , notificationResponseType = ${notificationResponse.notificationResponseType}",
          );

          didReceiveLocalNotificationStream.add(
            ReceivedNotification(
              id: notificationResponse.id ?? 0,
              title: notificationResponse.input,
              body: null,
              payload: notificationResponse.payload,
            ),
          );

          print(
            "notificationTag onDidReceiveNotificationResponse ${notificationResponse.toString()}",
          );
        },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  print("notificationTag  showFlutterNotification ${message.toMap()}");
  final data = message.data;
  print("notificationTag before title = ${data["title"]}");
  print("notificationTag before body = ${data["body"]}");

  String? title = data["title"];
  String? body = data["body"];

  print("notificationTag after title = ${data["title"]}");
  print("notificationTag after body = ${data["body"]}");

  try {
    flutterLocalNotificationsPlugin.show(
      Random().nextInt(4343),
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.max,
          channelDescription: channel.description,
          icon: "icon",
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  } catch (e) {
    print("notificationTag  ${e.toString()}");
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
