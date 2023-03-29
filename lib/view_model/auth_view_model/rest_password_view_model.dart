// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';

import '../../repository/auth_repo/reset_password_repository.dart';

class ResetPasswordViewModel with ChangeNotifier {
  bool _resetPasswordloading = false;

  bool? success;
  String? message;

  bool get resetPasswordloading => _resetPasswordloading;

  setLoading(bool value) {
    _resetPasswordloading = value;
    notifyListeners();
  }

  final _myrepo = ResetPasswordRepository();

  Future<void> resetPasswordApi(
    dynamic data,
    BuildContext context,
  ) async {
    setLoading(true);
    _myrepo
        .resetPasswordApi(
      data,
    )
        .then((value) {
      {
        setLoading(false);
        debugPrint('is aaaaaaaaaaaaaaaa $value');

        success = value['status'];
        if (success == true) {
          message = value['message'] ?? 'Password reset succesfully';
          Utils.toastMessage(message: message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.logIn,
            (route) => false,
          );
        } else {
          message = value['message'] ?? 'Try Again';
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
  }
}
