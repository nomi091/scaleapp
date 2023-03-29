// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/repository/auth_repo/verify_otp_repository.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';

class VerifyOtpViewModel with ChangeNotifier {
  bool _verifyotploading = false;

  bool? success;
  String? message;

  bool get verifyotploading => _verifyotploading;

  setLoading(bool value) {
    _verifyotploading = value;
    notifyListeners();
  }

  final _myrepo = VerifyOtpRepository();

  Future<void> verifyOtpApi(
    dynamic data,
    BuildContext context,
    String email,
  ) async {
    setLoading(true);
    _myrepo
        .verifyOtpApi(
      data,
    )
        .then((value) {
      {
        setLoading(false);
        debugPrint('is aaaaaaaaaaaaaaaa $value');

        success = value['status'];
        if (success == true) {
          message = value['message'] ?? 'OTP is verified';
          Utils.toastMessage(message: message);
          Navigator.pushReplacementNamed(
            context,
            RoutesName.resetpassword,
            arguments: {
            'emailfromforgetpasswor': email,
          }
          );
        } else {
          message = value['message'] ?? 'Invalid otp';
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
