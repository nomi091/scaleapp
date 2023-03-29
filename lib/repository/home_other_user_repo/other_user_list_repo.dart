import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/model/home_user_list_model/other_user_list_model.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class UsersListRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<UserDataListModel> otherUserListApi(String token) async {
    try {
      dynamic response = await _apiService.getApiResponse(
          AppUrl.otheruserinfoListEndPoint, true, token, null);
      return UserDataListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
