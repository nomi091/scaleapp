// import 'package:flutter/foundation.dart';
// import 'package:scaleapp/data/network/base_api_services.dart';
// import 'package:scaleapp/data/network/network_api_service.dart';
// import 'package:scaleapp/model/user_model/user_info_model.dart';
// import 'package:scaleapp/model/user_profile_model/get_user_profile_model.dart';
// import 'package:scaleapp/utils/constants/app_url.dart';

// class GetUserProfileRepository {
//   final BaseApiService _apiService = NetworkApiService();

//   Future<UserInfoProfileModel> getuserProfileApi(
//       String token, int userId) async {
//     try {
//       debugPrint(userId.toString());
//       dynamic response = await _apiService.getApiResponse(
//         AppUrl.useInformationEndPoint + userId.toString(),
//         true,
//         token,
//         null,
//       );
//       return UserInfoProfileModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
