// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/home_other_user_repo/report_user_repo.dart';
import 'package:scaleapp/res/provider/home_provider/report_filepick_provider.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class ReportUserViewModel with ChangeNotifier {
  bool _reportloading = false;
  bool? success;
  String? message;
  String? token;

  bool get reportloading => _reportloading;
  Future<UserModel> getUserData() => UserViewModel().getUser();

  setLoading(bool value) {
    _reportloading = value;
    notifyListeners();
  }

  final _myrepo = ReportRepository();

  Future<void> reportUserApi(
    dynamic data,
    BuildContext context,
  ) async {
    final reportFilePickprovider =
        Provider.of<ReportFilePickprovider>(context, listen: false);
    setLoading(true);
    getUserData().then((value) {
      token = value.token.toString();
      // token = '104|IPE7wQixrDBsFAfcfVwZnmANWJj43FT6VmpT0Q6Z';
      debugPrint('$token is aaaaa');
    }).then((value) {
      _myrepo
          .reportApi(
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
            // Navigator.pushReplacementNamed(
            //   context,
            //   RoutesName.bottomnav,
            // );
            Navigator.pop(context);
            reportFilePickprovider.setNullFile();
            reportFilePickprovider.setListtoNull();
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
