// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/repository/auth_repo/forget_password_repository.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  bool _forgetpasswordloading = false;

  bool? success;
  String? message;

  bool get forgetpasswordloading => _forgetpasswordloading;

  setLoading(bool value) {
    _forgetpasswordloading = value;
    notifyListeners();
  }

  final _myrepo = ForgetPasswordRepository();

  Future<void> forgetpasswordApi(
    dynamic data,
    BuildContext context,
    String email,
  ) async {
    setLoading(true);
    _myrepo
        .forgetpasswordApi(
      data,
    )
        .then((value) {
      {
        setLoading(false);
        debugPrint('is aaaaaaaaaaaaaaaa $value');

        success = value['status'];
        if (success == true) {
          message = value['message'] ?? 'Otp sent succesfully';
          Utils.toastMessage(message: message);
          Navigator.pushNamed(context, RoutesName.verifypin, arguments: {
            'emailfromforgetpasswor': email,
          });
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
  }
}
