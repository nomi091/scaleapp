import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/model/chat_models/liked_users_list_model.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class LikedUsersListRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<LikedUsersIDS> likedUserListApi(String token) async {
    try {
      dynamic response = await _apiService.getApiResponse(
          AppUrl.likedUsersListEndPoint, true, token, null,);
      return LikedUsersIDS.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
