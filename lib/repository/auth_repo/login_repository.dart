import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class LoginRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data, bool tokentrue) async {
    try {
      print('here');
      dynamic response = await _apiService.postApiResponse(
        AppUrl.loginEndPoint,
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
