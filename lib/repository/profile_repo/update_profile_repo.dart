import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class UpdateProfileRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> updateProfilepApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.updateProfileEndPoint,
        data,
        true,
        token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
