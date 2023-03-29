import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class DeleteAccountRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> deleteAccountApi({bool? tokentrue, String? token}) async {
    try {
      dynamic response = await _apiService.deleteApiResponse(
        AppUrl.deleteAccountEndPoint,
        token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
