import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:map_app/main.dart';
import 'package:map_app/routes/routes.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }
class FirebaseApi{
  final _firebaseMessage = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'hight_importance_channel', 
    'hirht Importance Notification',
    description: 'This channel is used for importance notification',
    importance: Importance.defaultImportance
  );
  final _localNotification = FlutterLocalNotificationsPlugin();
  void handMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState?.pushNamed(
      Routes.homePage,
      arguments: message
    );
  }
  Future initLocalNotification() async{
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/circle_icon');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (response){
        final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
        handMessage(message);
      }
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }  
  Future initPushNotification() async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if(notification==null) return;
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id, 
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/circle_icon'
          )
        ),
        payload: jsonEncode(message.toMap())
      );
    });
  }
  Future<void> initNotifications() async{
    await _firebaseMessage.requestPermission();
    final fCMTocken = await _firebaseMessage.getToken();
    print('Token: $fCMTocken');
    initPushNotification();
    initLocalNotification();
  }  
}