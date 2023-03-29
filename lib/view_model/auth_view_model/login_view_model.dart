// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/auth_repo/login_repository.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/scroll_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';

class LoginViewModel with ChangeNotifier {
  bool _loginloading = false;

  bool? success;
  String? message;
  String? token;
  int? userId;
  String? userName;

  bool get loginloading => _loginloading;

  setLoading(bool value) {
    _loginloading = value;
    notifyListeners();
  }

  final _myrepo = LoginRepository();

  Future<void> loginApi(
      dynamic data, BuildContext context, String email) async {
    final userPrefernces = Provider.of<UserViewModel>(context, listen: false);
    FireBaseFunctions fireBaseFunctions = FireBaseFunctions();
    setLoading(true);
    _myrepo.loginApi(data, false).then((value) {
      {
        setLoading(false);
        // print(value);
        print('value[user][id]}//////////////////////////////////////');
        // print('${value['user']['id']}');

        success = value['status'];

        if (success == true) {
          token = value['token'];
          userId = value['user']['id'];
          userName = value['user']['first_name'].toString().toLowerCase();
          message = value['message'];
          fireBaseFunctions
              .createUserwithEmail(
            context: context,
            userEmail: email,
          )
              .then((value) {
            fireBaseFunctions.loginUser(
              context: context,
              userEmail: email,
            );
          });

          // debugPrint(value['user']['id'].toString());
          // // debugPrint(value['user']['latitude'].toString());
          // debugPrint(value['token'].toString());
          // debugPrint(value['status'].toString());
          debugPrint(token.toString());
          print(userName);
          userPrefernces.saveUser(
            UserModel(
              token: token.toString(),
              id: userId,
              latitude: value['user']['latitude'] ?? '',
              userName: userName,
              // latitude: '',
            ),
          );

          Utils.toastMessage(message: message);
          if (value['user']['latitude'] == null ||
              value['user']['latitude'] == '') {
            Navigator.pushNamed(
              context,
              RoutesName.location,
              // (route) => false,
            );
          } else {
            final bottomNavProvider =
                Provider.of<BottomNavProvider>(context, listen: false);
                // final scrollprovider = Provider.of<Scrollprovider>(context, listen: false);
                // scrollprovider.setID(passid: -1);
            bottomNavProvider.setindex(0);
            /// Set User Hit API ///
        //     final userAPIprovider =
        //     Provider.of<UserAPIprovider>(context, listen: false);
        // userAPIprovider.setHitApi(passhitAPi: true);
        /// Set User Hit API ///
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.bottomnav,
              (route) => false,
            );
          }
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
  }
}
