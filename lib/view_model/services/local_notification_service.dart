// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initialize() async {
//     // initializationSettings  for Android
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//       iOS: IOSInitializationSettings()
//     );

//     _notificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: (String? id) async {
//         if (kDebugMode) {
//           print("onSelectNotification");
//         }

//         // Get.toNamed(
//         //   RoutesName.morepics,
//         //   arguments: {
//         //     'userId': 123,
//         //   },
//         // );

//         if (id!.isNotEmpty) {
//           if (kDebugMode) {
//             print("Router Value1234 $id");
//           }

//           // Navigator.of(context).push(
//           //   MaterialPageRoute(
//           //     builder: (context) => DemoScreen(
//           //       id: id,
//           //     ),
//           //   ),
//           // );

//         }
//       },
//     );
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint('A new onMessageOpenedApp event was published!');
//       // Get.toNamed(
//       //   RoutesName.morepics,
//       //   arguments: {
//       //     'userId': 123,
//       //   },
//       // );
//     });

//     FirebaseMessaging.onBackgroundMessage((message) async {
//       // Get.toNamed(
//       //   RoutesName.morepics,
//       //   arguments: {
//       //     'userId': 123,
//       //   },
//       // );
//     });
//   }

//   static void createanddisplaynotification(RemoteMessage message) async {
//     try {
//       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//       const NotificationDetails notificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails(
//           "Zeedlive",
//           "pushnotificationappchannel",
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: 'flutter_devs',
//           largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
//         ),
//         iOS: IOSNotificationDetails(
//           presentAlert: true,
//           presentSound: true
//         )
//       );

//       await _notificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
// }
