import 'package:scaleapp/data/network/base_api_services.dart';
import 'package:scaleapp/data/network/network_api_service.dart';
import 'package:scaleapp/utils/constants/app_url.dart';

import '../../model/home_user_list_model/user_more_info_model.dart';

class OtherUserUserMoreInfo {
  final BaseApiService _apiService = NetworkApiService();

  Future<OtherUserMoreInfoModel> otheruserMoreInfoApi(
      {String? id, String? token}) async {
    try {
      dynamic response = await _apiService.getApiResponse(
          AppUrl.useInformationEndPoint + id!, true, token!, null);
      return OtherUserMoreInfoModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
