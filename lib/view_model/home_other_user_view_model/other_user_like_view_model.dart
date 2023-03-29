import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/home_other_user_repo/other_user_like_repo.dart';
import 'package:scaleapp/repository/home_other_user_repo/other_user_unlike_repo.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class OtherUserFollowViewModel with ChangeNotifier {
  bool _likeloading = false;
  bool _likedMe = false;
  bool _firBaseFunLoasding = false;
  bool? success;
  String? message;
  String? token;
  int? spId;
  String? userName;

  ///
  int? _likedToUserID;
  int? get likedToUserID => _likedToUserID;
  String? _likedToUserName;
  String? get likedToUserName => _likedToUserName;
  String? _likedToUserProfile;
  String? get likedToUserProfile => _likedToUserProfile;

  /////////////////
  int? _likedByUserID;
  int? get likedByUserID => _likedByUserID;
  String? _likedByUserProfile;
  String? get likedByUserProfile => _likedByUserProfile;

  ///
  bool get likeloading => _likeloading;
  bool? get likedme => _likedMe;
  bool? get firBaseFunLoasding => _firBaseFunLoasding;

  setLoading(bool value) {
    _likeloading = value;
    notifyListeners();
  }

  setLikedMutal(
    bool val,
  ) {
    _likedMe = val;
    notifyListeners();
  }

  setFirebaseFunLoading(
    bool val,
  ) {
    _firBaseFunLoasding = val;
    notifyListeners();
  }

  setLikedMutalIDS(
    int? likedToUserID,
    likedByUserID,
    likedToUserName,
    likedToUserProfile,
    likedByUserProfile,
  ) {
    _likedToUserID = likedToUserID;
    _likedByUserID = likedByUserID;
    _likedToUserName = likedToUserName;
    _likedToUserProfile = likedToUserProfile;
    _likedByUserProfile = likedByUserProfile;
    notifyListeners();
  }

  // setfollowed(int val) {
  //   print('${val}provider print');
  //   _followed = val;
  //   notifyListeners();
  // }

  final _myrepofollow = OtherUserLikeRepository();
  final _myrepoUnfollow = OtherUserUnLikeRepository();

  Future<UserModel> getUserData() => UserViewModel().getUser();
///////////////////for Follow Function//////////////////////////////////
  Future<void> otherUserLikeApi({
    BuildContext? context,
    dynamic data,
    int? herlikedToUserID,
    String? herelikedToUserName,
    String? herelikedToUserProfile,
    String? herelikedByUserName,
    String? herelikedByUserProfile,
  }) async {
    getUserData().then((value) {
      token = value.token.toString();
      spId = value.id;
      userName = herelikedByUserName;
      // debugPrint('userName.toString()');
      // debugPrint(userName.toString());
      setLoading(true);
    }).then((value) {
      _myrepofollow.otherUserLikepApi(data, token.toString()).then((value) {
        setLoading(false);

        debugPrint(value.toString());
        _likedMe = value['liked_me'];
        if (_likedMe == true) {
          setLikedMutal(
            _likedMe,
          );
          setLikedMutalIDS(
            herlikedToUserID,
            spId,
            herelikedToUserName!.toString().toLowerCase(),
            herelikedToUserProfile,
            herelikedByUserProfile,
          );
        } else {
          String message = value['message'];

          Utils.toastMessage(message: message);
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

  ///////////////////for UnFollow Function//////////////////////////////////
  Future<void> otherUserunLikeApi(
    BuildContext context,
    dynamic data,
  ) async {
    getUserData().then((value) {
      token = value.token.toString();
      setLoading(true);
    }).then((value) {
      _myrepoUnfollow.otherUserUnLikepApi(data, token.toString()).then((value) {
        setLoading(false);
        debugPrint(value.toString());
        String message = value['message'];
        Utils.toastMessage(message: message);
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
