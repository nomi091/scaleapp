// // ignore_for_file: file_names
// import 'package:flutter/cupertino.dart';
// import 'package:scaleapp/data/responce/api_responce.dart';
// import 'package:scaleapp/model/user_model/user_info_model.dart';
// import 'package:scaleapp/model/user_model/user_model.dart';
// import 'package:scaleapp/repository/auth_repo/user_info_repo.dart';
// import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

// class GetUserProfileViewModel with ChangeNotifier {
//   // final _myrepo = GetUserProfileRepository();
//   final _myrepo = UserInfo();
//   ApiResponce<UserInfoProfileModel> getUserProfileData = ApiResponce.loading();

//   setUserProfileData(ApiResponce<UserInfoProfileModel> responce) {
//     getUserProfileData = responce;
//     debugPrint('responce.data!.user!.images!.length.toString()');
//     debugPrint(responce.status.toString());
//     notifyListeners();
//   }

//   Future<UserModel> getUserData() => UserViewModel().getUser();
//   Future<void> getUserDataApi(
//     BuildContext context,
//   ) async {
//     setUserProfileData(ApiResponce.loading());

//     getUserData().then((value) {
//       String token = value.token.toString();
//       String id = value.id.toString();
//       _myrepo.userInfoApi(id: id, token: token).then((value) {
//         setUserProfileData(ApiResponce.completed(value));
//         debugPrint(value.message.toString());
//         debugPrint(value.status.toString());
//       }).onError((error, stackTrace) {
//         setUserProfileData(ApiResponce.error(error.toString()));
//       });
//     });
//   }
// }
