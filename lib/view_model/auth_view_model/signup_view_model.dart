// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/repository/auth_repo/signup_repsitory.dart';
import 'package:scaleapp/res/provider/universal_providers/universal_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';

class SignUpViewModel with ChangeNotifier {
  bool _signuploading = false;
  String? message;
  bool? success;

  bool get signuploading => _signuploading;

  setLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  final _myrepo = SignUpRepository();
  Future<void> signUpApi(
      dynamic data, BuildContext context, String name, String email) async {
    FireBaseFunctions fireBaseFunctions = FireBaseFunctions();
    final universalProvider =
        Provider.of<UniversalProvider>(context, listen: false);
    setLoading(true);
    universalProvider.setStoredataonFireBase(false);
    _myrepo.signUpApi(data, false).then(
      (value) async {
        {
          print('value.toString()');
          print(value.toString());
          setLoading(false);
          success = value['status'];
          // String userId = value['user']['id'].toString();
          // token = value['token'] ?? '';
          print(success.toString());
          if (success == true) {
            ///
            message = value['message'] ?? 'SignUp Successfull';
            String firstname = value['user']['first_name'];
            String lastname = value['user']['last_name'] ?? '';
            int userID = value['user']['id'];
            String userProfile = value['user']['profile_image'] ?? 'null';

            debugPrint(name.toString());
            debugPrint(userID.toString());

            ///
            await Future.delayed(const Duration(seconds: 1));
            fireBaseFunctions.CreateOneUser(
              context: context,
              userName: '$firstname $lastname',
              userID: userID,
              userProfile: userProfile,
            );
            Utils.toastMessage(message: '$message');
            Navigator.pushReplacementNamed(
              context,
              RoutesName.logIn,
            );
          } else if (success == false) {
            message = 'Something went wrong';
            Utils.toastMessage(message: '$message');
          }
        }
      },
    ).onError((error, stackTrace) {
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
