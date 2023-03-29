// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/profile_repo/update_profile_repo.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/image_provider.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class UpdateProfileViewModel with ChangeNotifier {
  bool _updateProfileloading = false;

  bool? success;
  String? message;
  String? token;

  bool get updateProfileloading => _updateProfileloading;

  setLoading(bool value) {
    _updateProfileloading = value;
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  final _myrepo = UpdateProfileRepository();

  Future<void> updateProfileApi(dynamic data, BuildContext context) async {
    final imageViewModel = Provider.of<Imageprovider>(context, listen: false);
    // final bottomNavProvider = Provider.of<BottomNavProvider>(context, listen: false);
    // UserInformationViewModel userInformationViewModel =
    //     UserInformationViewModel();
    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    setLoading(true);
    getUserData().then((value) {
      token = value.token.toString();
      print('token in view model $token');
      // token = '35|cRUUSJ8R24P6iygHljsHX5afGywlaUAdQ9jxE215';

      // token = '89N3PDyZzakoH7W6n8ZrjGDDktjh8iWFG6eKRvi3kvpQ';
    }).then((value) {
      _myrepo.updateProfilepApi(data, token.toString()).then((value) {
        {
          setLoading(false);
          print(value);

          // success = value['status'];
          // // token = value['token'] ?? '';
          message = value['message'] ?? '';
          Utils.toastMessage(message: message.toString());
          imageViewModel.removeImage(true);
          imageViewModel.removeGalleryImage(true);
          // userInformationViewModel.userInfoApi(context);
          bottomNavProvider.setindex(0);
          // bottomNavProvider.setindex(0);
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
