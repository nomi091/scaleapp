// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/menu_repository/filter_repo.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_info_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class FilterViewModel with ChangeNotifier {
  bool _filterloading = false;
  String? message;
  String? token;

  bool get filterloading => _filterloading;

  setLoading(bool value) {
    _filterloading = value;
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  final _myrepo = FilterRepository();

  Future<void> filterApi(dynamic data, BuildContext context) async {
    UserInformationViewModel userInformationViewModel =
        UserInformationViewModel();

    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);

    setLoading(true);
    getUserData().then((value) {
      String token = value.token.toString();
      debugPrint(value.id.toString());
      _myrepo.filterApi(data, token).then((value) async {
        {
          setLoading(false);

          if (kDebugMode) {
            print(value);
          }

          bool status = value['status'];
          // print(status.toString());
          if (status == true) {
            message = value['message'];
            Utils.toastMessage(message: message);
            bottomNavProvider.setindex(0);
            // userInformationViewModel.userInfoApi(context);
            // await Future.delayed(const Duration(seconds: 2));
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
