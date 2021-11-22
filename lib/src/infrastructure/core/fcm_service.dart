import 'dart:convert';
import 'dart:math' as math;

import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kotlin_flavor/scope_functions.dart';

class FcmService {
  final FlutterLocalNotificationsPlugin localNotification =
      getIt<FlutterLocalNotificationsPlugin>();
  final FirebaseMessaging fcm = getIt<FirebaseMessaging>();

  Future<void> listenNotification() async {
    var initializeAndroidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeIOSSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
        defaultPresentSound: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true);
    var initializationSettings = InitializationSettings(
      android: initializeAndroidSettings,
      iOS: initializeIOSSettings,
    );
    localNotification.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
    final settings = await fcm.requestPermission(
        sound: true, badge: true, alert: true, provisional: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      logger.i('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      logger.i('User granted provisional permission');
    } else {
      logger.i('User declined or has not accepted permission');
    }

    final fcmKey = FlutterConfig.get('FCM').toString();

    var token = await fcm.getToken(
      vapidKey: fcmKey,
    );

    token?.let((it) {
      logger.i("Fcm Token : $it");
      //TODO: SAVE FCM TOKEN TO SESSIOn
      // context.read<SessionCubit>().saveUserFcmToken(it);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.i("FirebaseMessage received: $message");
      mapAndShowNotification(message.data);
    });
  }

  Future<void> _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    logger.i("Fcm notification clicked: $payload");
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    logger.i("Handling fcm background message: ${message.messageId}");
    mapAndShowNotification(message.data);
  }

  Future _onSelectNotification(dynamic payload) async {
    logger.i("Handling selectNotificatione: $payload");
    if (payload != null) {
      var parsedPayload = json.decode(payload);

      await _handleOnMessage(parsedPayload);
    }
  }

  Future<String?> _handleOnMessage(dynamic message) async {
    try {
      if (GetPlatform.isAndroid) {
        logger.i(">> Message : $message");
        if (message['data']['action'] != null &&
            message['data']['action'] != 'no') {
          var url = message['data']['action'];
          return url as String;
        } else {
          return null;
        }
      } else if (GetPlatform.isIOS) {
        if (message['action'] != null && message['action'] != 'no') {
          var url = message['action'];
          return url as String;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e, stack) {
      logger.e(e, stack);
      return null;
    }
  }

  mapAndShowNotification(Map<String, dynamic> message) async {
    logger.i("handle show notification : $message");
    String title = "";
    String body = "";
    if (GetPlatform.isAndroid) {
      title = '${message['notification']['title']}';
      body = '${message['notification']['body']}';
    } else {
      title = '${message['title']}';
      body = '${message['body']}';
    }

    localNotification.show(math.Random().nextInt(900) + 100, title, body,
        await _setupFcmNotification(),
        payload: json.encode(message));
  }

  Future<NotificationDetails> _setupFcmNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'EXPENSE_TRACKER_NOTIFICATION',
      'EXPENSE_TRACKER_NOTIFICATION',
      channelDescription: 'EXPENSE_TRACKER_NOTIFICATION',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
      playSound: true,
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    return platformChannelSpecifics;
  }
}
