import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:scaleapp/data/app_exceptions.dart';
import 'package:scaleapp/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url, bool tokentrue, String? token,
      dynamic queryParameters) async {
    dynamic responceJson;
    try {
      // if (kDebugMode) {
      //   print('In Dio in try');
      //   print(url);
      //   print(tokentrue.toString());
      //   print(token.toString());
      //   print('In Dio in try');
      // }
      Dio dio = Dio();
      if (tokentrue == true) {
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers["Authorization"] = "Bearer $token";
      } else {
        dio.options.headers['Accept'] = 'application/json';
      }
      Response responce = await dio
          .get(url, queryParameters: queryParameters)
          .timeout(const Duration(seconds: 20));
      responceJson = returnResponce(responce);
      debugPrint(responce.statusCode.toString());
      debugPrint(responce.statusMessage.toString());
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 500) {
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        throw DataInvalidException(e.response!.data['message']);
      } else {
        // debugPrint(e.response!.statusCode.toString());

        throw FetchDataException('${e.response!.statusCode}');
      }
    }
    return responceJson;
  }

  @override
  Future postApiResponse(
      String url, dynamic data, bool tokentrue, String? token) async {
    dynamic responceJson;
    try {
      // print('here 222');
      // if (kDebugMode) {
      //   print('In Dio in try');
      //   print(url);
      //   print(data.toString());
      //   print(tokentrue.toString());
      //   print(token.toString());
      //   print('In Dio in try');
      // }
      Dio dio = Dio();
      if (tokentrue == true) {
        // dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers["authorization"] = "Bearer $token";
      } else {
        dio.options.headers['Accept'] = 'application/json';
      }
      // print('responceJson.toString()');
      Response responce = await dio
          .post(
            url,
            data: data,
          )
          .timeout(const Duration(seconds: 20));
      debugPrint('.toString()');
      responceJson = returnResponce(responce);

      debugPrint(responce.toString());
    } on DioError catch (e) {
      // if (kDebugMode) {
      //   print('e.toString() e.toString()111111111');
      // print(e.response!.statusCode.toString());
      //   print(e.toString());
      // }
      if (e.isNoConnectionError) {
        // debugPrint('isNoConnectionError');
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        // debugPrint('404 404 404');
        throw UnauthorizedException('');
      } else if (e.response!.data['message'] == 500) {
        // debugPrint('500 500 500');
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        // debugPrint('422 422 422 422');
        throw DataInvalidException(e.response!.data['message']);
      } else if (e.response!.statusCode == 302) {
        // debugPrint('302 302 302 302');
        throw ThreeZeroTwoException(e.response!.data['message']);
      } else {
        // debugPrint('default eroooooooooooorr');
        throw FetchDataException('${e.response!.statusCode}');
      }
    }

    return responceJson;
  }

  /// delete Api response
  ///
  @override
  Future deleteApiResponse(String url, String? token) async {
    dynamic responceJson;
    try {
      if (kDebugMode) {
        print('In Dio in Delete Api responce');
        print(url);
        print(token.toString());
        print('In Dio in Delete Api responce');
      }
      Dio dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      Response responce =
          await dio.delete(url).timeout(const Duration(seconds: 20));
      responceJson = returnResponce(responce);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        throw UnauthorizedException('');
      } else if (e.response!.data['message'] == 500) {
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        throw DataInvalidException(e.response!.data['message']);
      } else {
        throw FetchDataException('${e.response!.statusCode}');
      }
    }
    return responceJson;
  }

  dynamic returnResponce(Response responce) {
    switch (responce.statusCode) {
      case 200:
        dynamic responceJson = jsonDecode(responce.toString());
        return responceJson;
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
      error is SocketException; // import 'dart:io' for SocketException
}
