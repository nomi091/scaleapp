import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class GiveRankRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> giverankApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.giveRankEndPoint,
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
