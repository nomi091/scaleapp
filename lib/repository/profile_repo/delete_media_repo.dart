import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class DeleteMediaRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> deleteMediaApi({String? id, String? token}) async {
    try {
      dynamic response = await _apiService.deleteApiResponse(
        AppUrl.deleteMediaEndPoint + id!,
        token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
