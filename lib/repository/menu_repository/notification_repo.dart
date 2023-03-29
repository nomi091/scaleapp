import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/model/menu_models/get_notifications_list_model.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

class NotificationRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<GetNotificationsListModel> notificationApi(String token) async {
    try {
      dynamic response = await _apiService.getApiResponse(
        AppUrl.notificationsEndPoint,
        true,
        token,
        null,
      );
      return GetNotificationsListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
