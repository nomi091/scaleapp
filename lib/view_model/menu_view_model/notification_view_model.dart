// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:scaleapp/data/responce/api_responce.dart';
import 'package:scaleapp/model/menu_models/get_notifications_list_model.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/menu_repository/notification_repo.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class NotificationViewModel with ChangeNotifier {
  final _myrepo = NotificationRepository();
  ApiResponce<GetNotificationsListModel> notificationData =
      ApiResponce.loading();

  setoNotificationData(ApiResponce<GetNotificationsListModel> responce) {
    notificationData = responce;
    debugPrint('notification list got');

    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<void> notificationApi(
    BuildContext context,
  ) async {
    setoNotificationData(ApiResponce.loading());

    getUserData().then((value) {
      String token = value.token.toString();
      _myrepo.notificationApi(token).then((value) {
        setoNotificationData(ApiResponce.completed(value));
      }).onError((error, stackTrace) {
        setoNotificationData(ApiResponce.error(error.toString()));
      });
    });
  }
}
