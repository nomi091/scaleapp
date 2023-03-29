import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';

class Profileservices {
  Future<bool> removeUserData() => UserViewModel().remove();
  FireBaseFunctions fireBaseFunctions = FireBaseFunctions();

  void clearSharedPrefernce(
    BuildContext context,
  ) async {
    final userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    
    if (kDebugMode) {
      print('Enter in function');
    }

    removeUserData().then((value) {
      // fireBaseFunctions.logoutUser();

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.chooseLoginSignUp, (route) => false);
      // bottomNavProvider.setindex(0);
      userProfileProvider.clearUserProfileProvider();
    });
  }
}
