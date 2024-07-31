import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // step 1
  Future<void> requestNotificationsPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('permissing granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisonal permission');
    } else {
      print('user denied permission');
    }
  }

//00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidinitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting =
        InitializationSettings(android: androidinitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onSelectNotification: (payload) async {},
    );
  }

//if token expire
//00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isAndroid) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

//00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
  Future<void> showNotification(RemoteMessage message) async {
    //channel
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'important notifications',
      'its meq driver',
      importance: Importance.max,
    );
    // details
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      'meq driver description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  
  //00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print(' device token is 🔥🔥🔥🔥🔥🔥$token🔥🔥🔥🔥🔥🔥');
    return token!;
    
  }

//00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((onData) {
      onData.toString();
      print('refreshed');
    });
  }

  //00000000000000000000000000000000000000000000000000000
  // 000000000000000000000000000000000000000000000000000000000
}
