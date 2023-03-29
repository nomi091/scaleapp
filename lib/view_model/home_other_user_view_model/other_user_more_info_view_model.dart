// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/data/responce/api_responce.dart';
import 'package:scaleapp/model/home_user_list_model/user_more_info_model.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/auth_repo/user_more_info_repository.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class OtherUserMoreInformationViewModel with ChangeNotifier {
  final _myrepo = OtherUserUserMoreInfo();
  ApiResponce<OtherUserMoreInfoModel> otherusermoreinfoData =
      ApiResponce.loading();

  setUserMoreInfoData(ApiResponce<OtherUserMoreInfoModel> responce) {
    otherusermoreinfoData = responce;
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<void> otheruserMoreInfoApi(
    BuildContext context,
    int userId,
  ) async {
    setUserMoreInfoData(ApiResponce.loading());

    getUserData().then((value) {
      String token = value.token.toString();

      if (kDebugMode) {
        print(token.toString());
      }
      _myrepo
          .otheruserMoreInfoApi(id: userId.toString(), token: token)
          .then((value) {
        if (kDebugMode) {
          print('user more info 11111 1111 111 11 1');
          print(value.users!.about.toString());
          print(value.users!.images!.length.toString());
          print(value.users!.email.toString());
        }
        setUserMoreInfoData(ApiResponce.completed(value));
      }).onError((error, stackTrace) {
        setUserMoreInfoData(ApiResponce.error(error.toString()));
      });
    });
  }
}
