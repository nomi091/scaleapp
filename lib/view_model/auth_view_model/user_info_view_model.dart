// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/data/responce/api_responce.dart';
import 'package:scaleapp/model/user_model/user_info_model.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/auth_repo/user_info_repo.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class UserInformationViewModel with ChangeNotifier {
  final _myrepo = UserInfo();
  ApiResponce<UserInfoProfileModel> usersprofileData = ApiResponce.loading();

  setUsersprofileData(ApiResponce<UserInfoProfileModel> responce) {
    usersprofileData = responce;
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<void> userInfoApi(
    BuildContext context,
  ) async {
    setUsersprofileData(ApiResponce.loading());

    getUserData().then((value) {
      String token = value.token.toString();
      String id = value.id.toString();
      // debugPrint('//////////////////////////////////////////////////////////');
      // debugPrint(id);
      // String id1 = '113';
      if (kDebugMode) {
        // print(token.toString() + id.toString());
      }
      _myrepo.userInfoApi(id: id, token: token).then((value) {
        if (kDebugMode) {
          // print('here runnnnnn 1111');
          // print(' is a ${value.users!.rank.toString()}');
        }

        setUsersprofileData(ApiResponce.completed(value));
        final userData =
            Provider.of<UserProfileProvider>(context, listen: false);
        if (kDebugMode) {
          // print('after adding provider value runnnnnn 4444444');
          // print('after adding provider value runnnnnn 33333333333');
        }
        Users userProfileModel = value.users!;
        userData.user = userProfileModel;

        Filter filter = value.users!.filter!;
        userData.filterinfo = filter;
        if (kDebugMode) {
          // print('after adding provider value runnnnnn 2222222222222');
          // print(filter.isShowRank.toString());
        }
        MatchPreference matchPreference = value.users!.matchPreference!;
        userData.preference = matchPreference;
        if (kDebugMode) {
          // print('after adding provider value runnnnnn 6666666');
          // print(value.users!.matchPreference!.isPocket.toString());
        }

        /// User API will Not Hit AGain ///
        // final userAPIprovider =
        //     Provider.of<UserAPIprovider>(context, listen: false);
        // userAPIprovider.setHitApi(passhitAPi: false);
        // userprofileData.images = value.users!.matchPreference!;
      }).onError((error, stackTrace) {
        setUsersprofileData(ApiResponce.error(error.toString()));
      });
    });
  }
}
