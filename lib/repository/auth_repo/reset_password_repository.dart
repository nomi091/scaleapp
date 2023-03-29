import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class ResetPasswordRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> resetPasswordApi(dynamic data,) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.resetPasswordEndPoint,
        data,
        false,
        '',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
