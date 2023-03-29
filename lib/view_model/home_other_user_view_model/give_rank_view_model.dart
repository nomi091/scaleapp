// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/home_other_user_repo/give_rank_repo.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class GiveRankViewModel with ChangeNotifier {
  bool _giverankloading = false;

  bool? success;
  String? message;
  String? token;
  int? userId;

  bool get giverankloading => _giverankloading;

  setLoading(bool value) {
    _giverankloading = value;
    notifyListeners();
  }

  final _myrepo = GiveRankRepository();
  Future<UserModel> getUserData() => UserViewModel().getUser();

  Future<void> giveRankApi(dynamic data, BuildContext context) async {
    setLoading(true);
    getUserData().then((value) {
      String token = value.token.toString();
      // debugPrint('${value.id.toString()}');
      _myrepo.giverankApi(data, token).then((value) async {
        {
          setLoading(false);

          if (kDebugMode) {
            print(value);
          }

          bool status = value['status'];
          print(status.toString());
          if (status == true) {
            message = value['message'];
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
