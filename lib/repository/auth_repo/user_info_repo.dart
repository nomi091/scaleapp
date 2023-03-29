import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/model/user_model/user_info_model.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class UserInfo {
  final BaseApiService _apiService = NetworkApiService();

  Future<UserInfoProfileModel> userInfoApi({String? id, String? token}) async {
    try {
      dynamic response = await _apiService.getApiResponse(
          AppUrl.useInformationEndPoint + id!, true, token!, null);
      return UserInfoProfileModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
