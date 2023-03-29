// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/profile_repo/delete_media_repo.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view/profile_screens/edit_profile_screen.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class DeleteMediaViewModel with ChangeNotifier {
  bool _deletemedialoading = false;
  bool? success;
  String? message;
  String? token;
  int? UserID;

  bool get deletemedialoading => _deletemedialoading;
  Future<UserModel> getUserData() => UserViewModel().getUser();

  setLoading(bool value) {
    _deletemedialoading = value;
    notifyListeners();
  }

  final _myrepo = DeleteMediaRepository();

  Future<void> deleteMediaApi(BuildContext context, String id) async {
    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    setLoading(true);
    getUserData().then((value) {
      token = value.token.toString();
      UserID = value.id;
      debugPrint('$token is aaaaa');
    }).then((value) {
      _myrepo.deleteMediaApi(id: id, token: token).then((value) {
        {
          setLoading(false);
          success = value['status'];

          if (success == true) {
            message = value['message'];
            Utils.toastMessage(message: message);
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.bottomnav,
              (route) => false,
            );
            bottomNavProvider.setindex(1);
            const ProfileEditingScreen();
          } else if (success == false) {
            message = value['message'].toString();
            Utils.toastMessage(message: message);
          }
        }
      }).onError((error, stackTrace) {
        {
          setLoading(false);
          Utils.toastMessage(message: error.toString());
          if (kDebugMode) {
            print(error.toString());
          }
        }
      });
    });
  }
}
