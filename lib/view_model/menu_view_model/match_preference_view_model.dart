import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/menu_repository/match_preference_repo.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/edit_profile_provider.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class MatchPreferenceViewModel with ChangeNotifier {
  bool _preferenceloading = false;
  String? message;
  String? token;

  bool get preferenceloading => _preferenceloading;

  setLoading(bool value) {
    _preferenceloading = value;
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  final _myrepo = MatchPreferenceRepository();

  Future<void> matchPreferenceApi(dynamic data, BuildContext context) async {
    // UserInformationViewModel userInformationViewModel =
    // UserInformationViewModel();
    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    final editProfileProvider =
        Provider.of<MatchPrefrencesProvider>(context, listen: false);
    setLoading(true);
    getUserData().then((value) {
      String token = value.token.toString();
      _myrepo.matchPrefernceApi(data, token).then((value) async {
        {
          setLoading(false);

          if (kDebugMode) {
            print(value);
          }

          // print(value);
          bool status = value['status'];
          if (status == true) {
            message = value['message'];
            Utils.toastMessage(message: message);
            // userInformationViewModel.userInfoApi(context);
            editProfileProvider.setblur();
            await Future.delayed(const Duration(milliseconds: 1500));
            // ignore: use_build_context_synchronously
            // Navigator.pushReplacementNamed(
            //   context,
            //   RoutesName.bottomnav,
            // );
            bottomNavProvider.setindex(0);
            // userInformationViewModel.userInfoApi(context);
            // await Future.delayed(const Duration(seconds: 2));
            /// Set User Hit API ///
            // final userAPIprovider =
            //     Provider.of<UserAPIprovider>(context, listen: false);
            // userAPIprovider.setHitApi(passhitAPi: true);

            /// Set User Hit API ///
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.bottomnav,
              (route) => false,
            );
            editProfileProvider.setblur();
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
