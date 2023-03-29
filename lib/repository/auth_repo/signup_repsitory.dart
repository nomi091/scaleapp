import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class SignUpRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> signUpApi(dynamic data, bool tokentrue) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.signupEndPoint,
        data,
        tokentrue,
        '',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
