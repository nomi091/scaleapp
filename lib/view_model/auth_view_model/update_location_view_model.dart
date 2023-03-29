// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/auth_repo/update_location_repository.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/scroll_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';

class UpdateLocationViewModel with ChangeNotifier {
  bool _updatelocationloading = false;
  bool? success;
  String? message;
  String? token;
  String? userName;

  bool get updatelocationloading => _updatelocationloading;
  Future<UserModel> getUserData() => UserViewModel().getUser();

  setLoading(bool value) {
    _updatelocationloading = value;
    notifyListeners();
  }

  final _myrepo = UpdateLocationRepository();

  Future<void> updateLocationApi(
    BuildContext context,
    dynamic data,
  ) async {
    final userPrefernces = Provider.of<UserViewModel>(context, listen: false);
    FireBaseFunctions fireBaseFunctions = FireBaseFunctions();
    setLoading(true);
    getUserData().then((value) {
      token = value.token.toString();
      // token = '104|IPE7wQixrDBsFAfcfVwZnmANWJj43FT6VmpT0Q6Z';
      debugPrint('$token is aaaaa');
    }).then((value) {
      _myrepo
          .updateLocationApi(
        token: token,
        data: data,
      )
          .then((value) {
        {
          setLoading(false);
          success = value['status'];
          debugPrint(value.toString());

          if (success == true) {
            message = value['message'];
            Utils.toastMessage(message: message);
            String lati = value['user']['latitude'].toString();
            userName = value['user']['first_name'].toString().toLowerCase();
            debugPrint(lati.toString());
            userPrefernces.saveUser(
              UserModel(
                token: token.toString(),
                id: value['user']['id'],
                latitude: lati,
                userName: userName,
              ),
            );
            // fireBaseFunctions
            //     .loginUser(context: context, userEmail: email)
            // .then((value) {
            // Navigator.pushReplacementNamed(
            //   context,
            //   RoutesName.bottomnav,
            // );
            final bottomNavProvider =
                Provider.of<BottomNavProvider>(context, listen: false);
            // final scrollprovider = Provider.of<Scrollprovider>(context, listen: false);
            //     scrollprovider.setID(passid: -1);
            /// Set User Hit API ///
        //     final userAPIprovider =
        //     Provider.of<UserAPIprovider>(context, listen: false);
        // userAPIprovider.setHitApi(passhitAPi: true);
        /// Set User Hit API ///
            bottomNavProvider.setindex(0);

            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.bottomnav,
              (route) => false,
            );
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
