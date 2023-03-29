// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:scaleapp/data/responce/api_responce.dart';
import 'package:scaleapp/model/chat_models/liked_users_list_model.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/chat_repo/liked_users_repo.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class LikedUsersListViewModel with ChangeNotifier {
  final _myrepo = LikedUsersListRepository();
  ApiResponce<LikedUsersIDS> likedUsersList = ApiResponce.loading();

  setlikedUserseData(ApiResponce<LikedUsersIDS> responce) {
    likedUsersList = responce;
    print(responce.status);
    print(responce.data.toString());
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<void> likedUserListApi(
    BuildContext context,
  ) async {
    debugPrint('Enter in getting List of UseLiked');
    setlikedUserseData(ApiResponce.loading());

    getUserData().then((value) {
      String token = value.token.toString();
      _myrepo.likedUserListApi(token).then((value) {
        setlikedUserseData(ApiResponce.completed(value));
      }).onError((error, stackTrace) {
        setlikedUserseData(ApiResponce.error(error.toString()));
      });
    });
  }
}
