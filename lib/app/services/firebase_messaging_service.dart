import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../domain/repositories/user_repository.dart';
import '../app.locator.dart';
import '../app.logger.dart';

class FirebaseMessageService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late Stream<String> _tokenStream;
  VoidCallback? onShown;
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const channel = AndroidNotificationChannel(
      'regardless_notification_channel_id', // id
      'New notifications', // title
      description:
          'This channel is used for delivery alerts and statuses notifications in Regardless app.', // description
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      enableLights: true);

  void init({VoidCallback? onNotificationShown}) async {
    onShown = onNotificationShown;
    getLogger('FirebaseMessageService').i('init');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (kIsWeb) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _setupFlutterNotifications();
      } else {
        _showPermissiosDeniedDialog();
      }

      return;
    }
    if (Platform.isIOS) {
      final bool result = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
// For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();

      if (result && apnsToken != null) {
        _setupFlutterNotifications();
      } else {
        _showPermissiosDeniedDialog();
      }
    } else {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _setupFlutterNotifications();
      } else {
        _showPermissiosDeniedDialog();
      }
    }
  }

  _showPermissiosDeniedDialog() {}

  Future<void> _setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await messaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    //FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
    getLogger('FirebaseMessageService').i('stream messaging setup done');
  }

  void _handleMessage(RemoteMessage message) {
    showFlutterNotification(message);
    onShown?.call();
  }

  Future<String?> retrieveToken() {
    return messaging.getToken(
        vapidKey:
            'BHiUDPnbHYMViNK-1UpAuH4MiIZ8Yekk6r4NpW6FJELYLZ3RCogdsH-pVwBgZTRY5DoDG6f4M10B4c-s1FVDeOc');
  }

  void _setupTokenRefreshMonitor() async {
    retrieveToken().then(setToken);
    _tokenStream = messaging.onTokenRefresh;
    _tokenStream.listen(setToken);
    getLogger('FirebaseMessageService').i('token refresh setup done');
  }

  void setToken(String? token) async {
    //Update token on the server
    if (token != null) {
      (await module<UserRepository>().updateDeviceToken(token)).when((success) {
        debugPrint(
            "FirebaseMessageService FCM Token: $token has been registered");
      }, (error) {
        debugPrint(
            "FirebaseMessageService FCM Token Error: $token || ${error.toString()}");
      });
    }
  }

  Future<void> _setupFlutterNotifications() async {
    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _setupTokenRefreshMonitor();
    _setupInteractedMessage();
  }

  static void showFlutterNotification(RemoteMessage message) async {
    getLogger('FirebaseMessageService')
        .i('message == ${message.notification?.toMap()}');
    getLogger('FirebaseMessageService').i('data == ${message.data.toString()}');
    if (message.notification != null) {
      RemoteNotification notification = message.notification!;
      var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        payload: message.data.toString(),
        NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'ic_notification',
              enableVibration: true,
              playSound: true,
              importance: Importance.max,
              //  sound: const RawResourceAndroidNotificationSound('cloop'),
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: notification.body,
            )),
      );
    }
  }
}
