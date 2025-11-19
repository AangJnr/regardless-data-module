// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io' show Directory, File, Platform;

import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:image/image.dart' as img;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../domain/model/notification.dart';
import '../../domain/repositories/user_repository.dart';
import '../app.locator.dart';
import '../app.logger.dart';

enum NotificationPermissionStatus { Na, Granted, Denied }

const notificationGrantedKey = "notificationGrantedKey";

class FirebaseMessageService {
  static bool shouldPauseNotifications = false;
  String groupKey = 'com.regardless.app.GROUP_KEY';
  String groupChannelId = 'com.regardless.app.GROUP_CHANNEL_ID';
  String groupChannelName = 'Regardless Notifications';
  String groupChannelDescription = 'Notifications from Regardless App';

  /// A notification action which triggers a url launch event
  String urlLaunchActionId = 'rUrlLaunchActionId';

  /// A notification action which triggers a App navigation event
  String navigationActionId = 'rNavigationActionId';

  /// Defines a iOS/MacOS notification category for text input actions.
  String darwinNotificationCategoryText = 'rTextCategory';

  /// Defines a iOS/MacOS notification category for plain actions.
  String darwinNotificationCategoryPlain =
      'regardless_notification_plain_category';

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late Stream<String> _tokenStream;

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static AndroidNotificationChannel getChannel([RNotification? notification]) =>
      AndroidNotificationChannel(
          'regardless_notification_channel_id', // id
          'New notifications',
          description:
              'This channel is used for delivery alerts and statuses notifications in Regardless app.',
          importance: Importance.high,
          playSound: true,
          enableVibration: true,
          enableLights: true);

  Future<bool> _checkAndroidPermission() async {
    return await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        false;
  }

  Future<bool> _checkIOSPermission() async {
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
    final apnsToken = await messaging.getAPNSToken();
    return (result && apnsToken != null);
  }

  Future<void> _setupFirebaseInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await messaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      showNotification(RNotification.fromMessage(initialMessage));
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(RNotification.fromMessage(message));
    });
  }

  void setupTokenRefreshMonitor() async {
    if (await arePermissionsGranted()) {
      messaging
          .getToken(
              vapidKey:
                  'BHiUDPnbHYMViNK-1UpAuH4MiIZ8Yekk6r4NpW6FJELYLZ3RCogdsH-pVwBgZTRY5DoDG6f4M10B4c-s1FVDeOc')
          .then(setToken);
      _tokenStream = messaging.onTokenRefresh;
      _tokenStream.listen(setToken);
    }
  }

//Notification Helpers
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

  void showNotification(RNotification notification) async {
    getLogger('FirebaseMessageService').i(notification.toString());
    if (notification.isTextInput && shouldPauseNotifications) {
      return;
    }

    final notificationDetails = await getNotificationDetails(notification);
    flutterLocalNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      notificationDetails,
      payload: jsonEncode(notification.data),
    );
  }

  void showNotificationProgress(RNotification notification,
      {int progress = 0}) async {
    getLogger('FirebaseMessageService').i(notification.toString());
    final channel = getChannel(notification);

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        groupKey: groupKey,
        progress: progress,
        enableVibration: false,
        importance: Importance.low,
        showProgress: true,
        onlyAlertOnce: true,
        channelShowBadge: false,
        icon: 'ic_notification',
        priority: Priority.high,
        ticker: 'ticker',
        autoCancel: false,
        maxProgress: 100,
        tag: notification.id.toString(),
        sound: RawResourceAndroidNotificationSound(
            'regardless_notification_sound'),
      ),
      iOS: const DarwinNotificationDetails(),
    );
    flutterLocalNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      notificationDetails,
      payload: jsonEncode(notification.data),
    );
  }

  void setPauseNotifications(bool pause) {
    shouldPauseNotifications = pause;
  }

  Future<void> scheduleNotificationMessage(RNotification notification) async {
    try {
      if (notification.scheduledTime == null) return;

      getLogger('FirebaseMessageService').i(notification.toString());
      final notificationDetails = await getNotificationDetails(notification);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        notification.id,
        notification.title,
        notification.body,
        payload: jsonEncode(notification.data),
        tz.TZDateTime.from(notification.scheduledTime!, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        // uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      getLogger('FirebaseMessageService').i(e.toString());
    }
  }

  Future<void> showNotificationSilently(RNotification notification) async {
    final channel = getChannel();

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            icon: 'ic_notification',
            autoCancel: false,
            sound: RawResourceAndroidNotificationSound(
                'regardless_notification_sound'),
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            silent: true);
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentSound: false,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
        macOS: darwinNotificationDetails);
    await flutterLocalNotificationsPlugin.show(notification.id,
        notification.title, notification.body, notificationDetails);
  }

  void cancelNotification(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<NotificationDetails> getNotificationDetails(
      RNotification notification) async {
    final channel = getChannel(notification);

    BigPictureStyleInformation? androidStyleInformation;
    List<DarwinNotificationAttachment> attachments = [];
    List<AndroidNotificationAction> androidActions = [];
    String? iosCategoryId;
    if (notification.data != null &&
        notification.data?.keys.contains('url') == true) {
      final String largeIconPath = await _downloadAndSaveFile(
          notification.data!['url'], '${notification.id}_largeIcon.jpg',
          isThumbnail: true);
      final String bigPicturePath = await _downloadAndSaveFile(
          notification.data!['url'], '${notification.id}_bigPicture.jpg');

      androidStyleInformation = BigPictureStyleInformation(
          FilePathAndroidBitmap(bigPicturePath),
          largeIcon: FilePathAndroidBitmap(largeIconPath),
          contentTitle: notification.title,
          summaryText: notification.body,
          htmlFormatContentTitle: true);

      attachments.add(DarwinNotificationAttachment(
        bigPicturePath,
        hideThumbnail: false,
      ));
    }

    if (notification.isTextInput) {
      iosCategoryId = darwinNotificationCategoryText;
      androidActions.add(AndroidNotificationAction(
        'reply_message',
        'Reply',
        showsUserInterface: true,
        allowGeneratedReplies: true,
        cancelNotification: true,
        icon: DrawableResourceAndroidBitmap('ic_notification'),
        inputs: <AndroidNotificationActionInput>[
          AndroidNotificationActionInput(
            label: 'Enter a message',
          ),
        ],
      ));
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            groupKey: groupKey,
            icon: 'ic_notification',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            autoCancel: false,
            tag: notification.id.toString(),
            sound: RawResourceAndroidNotificationSound(
                'regardless_notification_sound'),
            actions: androidActions,
            styleInformation: androidStyleInformation);
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      categoryIdentifier: iosCategoryId,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'regardless_notification_sound.aiff',
      attachments: attachments,
    );

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName,
      {bool isThumbnail = false}) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final Response response = await get(Uri.parse(url));
    final File file = File(filePath);

    if (isThumbnail) {
      // Decode the image
      img.Image? image = img.decodeImage(response.bodyBytes);
      if (image != null) {
        // Resize the image to 48x48
        img.Image thumbnail = img.copyResize(image, width: 48, height: 48);
        // Save as PNG
        await file.writeAsBytes(img.encodePng(thumbnail));
      }
    } else {
      // Save original image
      await file.writeAsBytes(response.bodyBytes);
    }

    return filePath;
  }

  Future<void> initialize(
      {ValueChanged<NotificationResponse>? onBackgroundNotificationReceived,
      ValueChanged<NotificationResponse>?
          onForegroundNotificationReceived}) async {
    await _configureLocalTimeZone();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: <DarwinNotificationCategory>[
        DarwinNotificationCategory(
          darwinNotificationCategoryText,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.text(
              'reply_message',
              'New Message',
              buttonTitle: 'Reply',
              placeholder: 'Enter a message',
            ),
          ],
        ),
        DarwinNotificationCategory(
          darwinNotificationCategoryPlain,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2 (destructive)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction.plain(
              navigationActionId,
              'Action 3 (foreground)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
            DarwinNotificationAction.plain(
              'id_4',
              'Action 4 (auth required)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.authenticationRequired,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        )
      ],
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onForegroundNotificationReceived,
      onDidReceiveBackgroundNotificationResponse:
          onBackgroundNotificationReceived,
    );

    checkInitialMessage();
    setupTokenRefreshMonitor();
    _setupFirebaseInteractedMessage();
  }

  Future<void> checkInitialMessage(
      [ValueChanged<NotificationResponse>?
          onForegroundNotificationReceived]) async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      if (notificationAppLaunchDetails?.notificationResponse != null) {
        onForegroundNotificationReceived
            ?.call(notificationAppLaunchDetails!.notificationResponse!);
      }
    }
  }

  Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    if (Platform.isWindows) {
      return;
    }
    final timeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone.identifier));
  }

  Future<bool> requestPermissions() async {
    var result = false;
    if (Platform.isIOS || Platform.isMacOS) {
      result = await _checkIOSPermission();
    } else if (Platform.isAndroid) {
      result = await _checkAndroidPermission();
    }

    return result;
  }

  Future<bool> arePermissionsGranted() async {
    if (Platform.isIOS || Platform.isMacOS) {
      return (await flutterLocalNotificationsPlugin
                  .resolvePlatformSpecificImplementation<
                      IOSFlutterLocalNotificationsPlugin>()
                  ?.checkPermissions())
              ?.isEnabled ??
          false;
    } else if (Platform.isAndroid) {
      return await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }
    return false;
  }

  void cancel(int hashCode) {
    flutterLocalNotificationsPlugin.cancel(hashCode);
  }
}

class RNotification {
  final String title;
  final String body;
  final int id;
  final String? channelKey;
  final DateTime? scheduledTime;
  final Map<String, dynamic>? data;
  final bool isTextInput;
  RNotification(
      {required this.title,
      required this.body,
      required this.id,
      this.channelKey,
      this.scheduledTime,
      this.data,
      this.isTextInput = false});
  factory RNotification.fromMessage(RemoteMessage message) {
    final metaData = message.data['metaData'] == null
        ? null
        : jsonDecode(message.data['metaData']) as Map<String, dynamic>;
    final type = message.data['type'] ?? message.data['action'];

    metaData?.putIfAbsent("type", () => type);
    return RNotification(
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        id: message.hashCode,
        data: metaData,
        isTextInput: type == NotificationType.NEW_MESSAGE.name);
  }

  @override
  String toString() {
    return 'RNotification(id:$id, title:$title, body:$body, data: $data, isTextInput:$isTextInput)';
  }
}
