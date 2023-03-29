import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class LocalAwesomeNotifications {
  static void initialize() async {


  /// awsome notification ///
  AwesomeNotifications().initialize(
      'resource://drawable/flutter_devs',
      [
        NotificationChannel(
            channelGroupKey: 'basic_tests',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            importance: NotificationImportance.High, playSound: true,),
        NotificationChannel(
            channelGroupKey: 'basic_tests',
            channelKey: 'badge_channel',
            channelName: 'Badge indicator notifications',
            channelDescription:
                'Notification channel to activate badge indicator',
            channelShowBadge: true,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.yellow),
        NotificationChannel(
            channelGroupKey: 'channel_tests',
            channelKey: 'updated_channel',
            channelName: 'Channel to update',
            channelDescription: 'Notifications with not updated channel',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white),
        NotificationChannel(
            channelGroupKey: 'vibration_tests',
            channelKey: 'low_intensity',
            channelName: 'Low intensity notifications',
            channelDescription:
                'Notification channel for notifications with low intensity',
            defaultColor: Colors.green,
            ledColor: Colors.green,
            vibrationPattern: lowVibrationPattern),
        NotificationChannel(
            channelGroupKey: 'vibration_tests',
            channelKey: 'medium_intensity',
            channelName: 'Medium intensity notifications',
            channelDescription:
                'Notification channel for notifications with medium intensity',
            defaultColor: Colors.yellow,
            ledColor: Colors.yellow,
            vibrationPattern: mediumVibrationPattern),
        NotificationChannel(
            channelGroupKey: 'vibration_tests',
            channelKey: 'high_intensity',
            channelName: 'High intensity notifications',
            channelDescription:
                'Notification channel for notifications with high intensity',
            defaultColor: Colors.red,
            ledColor: Colors.red,
            vibrationPattern: highVibrationPattern),
        NotificationChannel(
            channelGroupKey: 'privacy_tests',
            channelKey: "private_channel",
            channelName: "Privates notification channel",
            channelDescription: "Privates notification from lock screen",
            playSound: true,
            defaultColor: Colors.red,
            ledColor: Colors.red,
            vibrationPattern: lowVibrationPattern,
            defaultPrivacy: NotificationPrivacy.Private),
        NotificationChannel(
            channelGroupKey: 'sound_tests',
            channelKey: "silenced",
            channelName: "Silenced notifications",
            channelDescription: "The most quiet notifications",
            playSound: false,
            enableVibration: false,
            enableLights: false),
        NotificationChannel(
            channelGroupKey: 'image_tests',
            channelKey: 'big_picture',
            channelName: 'Big pictures',
            channelDescription: 'Notifications with big and beautiful images',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: const Color(0xFF9D50DD),
            vibrationPattern: lowVibrationPattern,
            importance: NotificationImportance.High),
        NotificationChannel(
            channelGroupKey: 'layout_tests',
            channelKey: 'big_text',
            channelName: 'Big text notifications',
            channelDescription: 'Notifications with a expandable body text',
            defaultColor: Colors.blueGrey,
            ledColor: Colors.blueGrey,
            vibrationPattern: lowVibrationPattern),
        NotificationChannel(
            channelGroupKey: 'layout_tests',
            channelKey: 'inbox',
            channelName: 'Inbox notifications',
            channelDescription: 'Notifications with inbox layout',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: const Color(0xFF9D50DD),
            vibrationPattern: mediumVibrationPattern),
        NotificationChannel(
          channelGroupKey: 'schedule_tests',
          channelKey: 'scheduled',
          channelName: 'Scheduled notifications',
          channelDescription: 'Notifications with schedule functionality',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: const Color(0xFF9D50DD),
          vibrationPattern: lowVibrationPattern,
          importance: NotificationImportance.High,
          defaultRingtoneType: DefaultRingtoneType.Alarm,
          criticalAlerts: true,
        ),
        NotificationChannel(
            channelGroupKey: 'grouping_tests',
            channelKey: 'grouped',
            channelName: 'Grouped notifications',
            channelDescription: 'Notifications with group functionality',
            groupKey: 'grouped',
            groupSort: GroupSort.Desc,
            groupAlertBehavior: GroupAlertBehavior.Children,
            defaultColor: Colors.lightGreen,
            ledColor: Colors.lightGreen,
            vibrationPattern: lowVibrationPattern,
            importance: NotificationImportance.High)
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_tests', channelGroupName: 'Basic tests'),
        NotificationChannelGroup(
            channelGroupKey: 'category_tests',
            channelGroupName: 'Category tests'),
        NotificationChannelGroup(
            channelGroupKey: 'image_tests', channelGroupName: 'Images tests'),
        NotificationChannelGroup(
            channelGroupKey: 'schedule_tests',
            channelGroupName: 'Schedule tests'),
        NotificationChannelGroup(
            channelGroupKey: 'chat_tests', channelGroupName: 'Chat tests'),
        NotificationChannelGroup(
            channelGroupKey: 'channel_tests',
            channelGroupName: 'Channel tests'),
        NotificationChannelGroup(
            channelGroupKey: 'sound_tests', channelGroupName: 'Sound tests'),
        NotificationChannelGroup(
            channelGroupKey: 'vibration_tests',
            channelGroupName: 'Vibration tests'),
        NotificationChannelGroup(
            channelGroupKey: 'privacy_tests',
            channelGroupName: 'Privacy tests'),
        NotificationChannelGroup(
            channelGroupKey: 'layout_tests', channelGroupName: 'Layout tests'),
        NotificationChannelGroup(
            channelGroupKey: 'grouping_tests',
            channelGroupName: 'Grouping tests'),
        NotificationChannelGroup(
            channelGroupKey: 'media_player_tests',
            channelGroupName: 'Media Player tests')
      ],
      debug: true);
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  /// awsome notification ///
  }
}
