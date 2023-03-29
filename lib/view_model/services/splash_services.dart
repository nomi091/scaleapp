// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    bottomNavProvider.setindex(0);
    getUserData().then((value) {
      if (kDebugMode) {
        print('print start here here herer');
        print('token ${value.token.toString()}');
        print('id ${value.id.toString()}');
        print('lati ${value.latitude.toString()}');
      }
      if (value.id == null || value.id == '') {
        if (kDebugMode) {
          print('Null token No location and no other thing');
        }
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.walkthroughone,
          (route) => false,
        );
      } else if (value.latitude == null || value.latitude == '') {
        if (kDebugMode) {
          print('No location and token is there');
        }
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.location,
          (route) => false,
        );
      } else {
        if (kDebugMode) {
          print('Not Null token');
          print(value.token.toString());
        }

        ///
        // final scrollprovider =
        //     Provider.of<Scrollprovider>(context, listen: false);
        // scrollprovider.setID(passid: -1);
        /// Set User Hit API ///
        // final userAPIprovider =
        //     Provider.of<UserAPIprovider>(context, listen: false);
        // userAPIprovider.setHitApi(
        //   passhitAPi: true,
        // );

        /// Set User Hit API ///
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.bottomnav,
          (route) => false,
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
