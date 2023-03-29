// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/menu_repository/delete_account_repo.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/services/profile_services.dart';

class DeleteAccountViewModel with ChangeNotifier {
  bool _deleteaccountloading = false;
  bool? success;
  String? message;
  String? token;

  bool get deleteAccountloading => _deleteaccountloading;
  Future<UserModel> getUserData() => UserViewModel().getUser();

  setLoading(bool value) {
    _deleteaccountloading = value;
    notifyListeners();
  }

  final _myrepo = DeleteAccountRepository();

  Future<void> deleteAccountApi(
      BuildContext context, dynamic bottomNavProvider) async {
    setLoading(true);
    getUserData().then((value) {
      token = value.token.toString();
      debugPrint('$token is aaaaa');
    }).then((value) {
      _myrepo.deleteAccountApi(tokentrue: true, token: token).then((value) {
        {
          setLoading(false);
          success = value['status'];

          if (success == true) {
            message = value['message'];
            Utils.toastMessage(message: message);
            Profileservices profileservices = Profileservices();
            profileservices.clearSharedPrefernce(context, );
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
