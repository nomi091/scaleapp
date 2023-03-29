// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/view_model/services/local_notification_service.dart';
import 'package:http/http.dart' as http;
import 'package:scaleapp/view_model/services/profile_services.dart';

class FirebaseMessageService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void startMessageListener(context) async {
    if (kDebugMode) {
      // print('Local Notification');
    }

    /// Local Notification
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = const IOSInitializationSettings();
    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    /// commented of duplication
    /// {{{{{{{{{
    // var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    //   'Notifications',
    //   'Events Notifications',
    //   // 'Notifies you about the events',
    //   // Todo 'Notifies you about the events', commented due to error
    //   icon: 'flutter_devs',
    //   largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
    // );

    /// var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    ///
    // var platformChannelSpecifics = NotificationDetails(
    //     android: androidPlatformChannelSpecifics,
    ///     iOS: iOSPlatformChannelSpecifics);
    /// {{{{{{{{{
    await FirebaseMessaging.instance.getToken();
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        String notificationTitle = message.notification!.title.toString();
        String notificationBody = message.notification!.body.toString();
        if (kDebugMode) {
          print('notificationTitle.toString()');
          print(notificationTitle.toString());
          print(notificationBody.toString());
          // print(message.notification!.);
        }

        ///
        if (message.notification!.title == 'Account Blocked') {
          final bottomNavProvider =
              Provider.of<BottomNavProvider>(context, listen: false);
          Profileservices profileservices = Profileservices();
          profileservices.clearSharedPrefernce(
            context,
          );
        }

        ///
        if (message.notification!.title == 'Account Deleted') {
          debugPrint('Inside the Account Deleted');
          debugPrint(notificationTitle.toString());
          final bottomNavProvider =
              Provider.of<BottomNavProvider>(context, listen: false);
          Profileservices profileservices = Profileservices();
          profileservices.clearSharedPrefernce(
            context,
          );
        }

        var a = jsonEncode(message.data);
        // AwesomeNotifications().createNotificationFromJsonData((message.data));

        
          AwesomeNotifications().createNotification(
            content: NotificationContent(
                title: notificationTitle,
                id: id,
                channelKey: 'basic_channel',
                body: notificationBody),
          );
        

        // flutterLocalNotificationsPlugin.show(
        //     0, notificationTitle, notificationBody, platformChannelSpecifics);
        // LocalNotificationService.createanddisplaynotification(message);

        ///// Extra code for notification Event ////////////////////////////////////////////////////////////////////////////////

        // initializationSettings  for Android
        // const InitializationSettings initializationSettings =
        //     InitializationSettings(
        //   android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        // );
        // final FlutterLocalNotificationsPlugin notificationsPlugin =
        //     FlutterLocalNotificationsPlugin();
        // notificationsPlugin.initialize(
        //   initializationSettings,
        //   onSelectNotification: (String? id) async {
        //     if (kDebugMode) {
        //       print("onSelectNotification Extra code for notification");
        //     }

        //     // Get.toNamed(
        //     //   RoutesName.morepics,
        //     //   arguments: {
        //     //     'userId': 123,
        //     //   },
        //     // );

        //     if (id!.isNotEmpty) {
        //       if (kDebugMode) {
        //         print("Router Value1234 $id");
        //       }

        //       // Navigator.of(context).push(
        //       //   MaterialPageRoute(
        //       //     builder: (context) => DemoScreen(
        //       //       id: id,
        //       //     ),
        //       //   ),
        //       // );

        //     }
        //   },
        // ///// Extra code for notification Event ////////////////////////////////////////////////////////////////////////////////

        // );
      },
    );

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // static Future<void> sendNotification(String title, String body) async {
  //   /// Local Notification
  //   var initializationSettingsAndroid =
  //       const AndroidInitializationSettings('flutter_devs');
  //   var initializationSettingsIOs = const IOSInitializationSettings();
  //   var initSettings = InitializationSettings(
  //       android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

  //   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
  //     'Notifications',
  //     'Events Notifications',
  //     // 'Notifies you about the events',
  //     // Todo commented 'Notifies you about the events', due to error
  //     icon: 'flutter_devs',
  //     largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
  //   );
  //   var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);
  //   if (kDebugMode) {
  //     print('good to go');
  //   }
  //   flutterLocalNotificationsPlugin.show(
  //       0, title, body, platformChannelSpecifics);
  // }

  //////////////////////// Extra added to send Notification /////////////////////////
  ///
  // static Future<void> sendPushMessage(
  //     String body, String title, String token) async {
  //   try {
  //     debugPrint('enter in try of sendPushMessage');
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'AAAAZLdzStk:APA91bFPsR3gnf8hsZDXUvNHVOjvs9kw7kJy2E2IVA_orBmHQXIT4hRNQu-namJk7snOJOMJoY2D1NUlYqPmGhEHtJ_6dWWet1Ag_hXkiPCiCc_B4Rw1RYa48l3dJ1-Xfl15yJTxO1SY',
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': body,
  //             'title': title,
  //           },
  //           'priority': 'high',
  //           'data': <String, dynamic>{
  //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //             'id': '1',
  //             'status': 'done'
  //           },
  //           "to": token,
  //         },
  //       ),
  //     );
  //     debugPrint('done sendPushMessage');
  //   } catch (e) {
  //     debugPrint("error push notification");
  //   }
  // }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('A background notification');
  }
}
