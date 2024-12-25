import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sknet_myadmin/http_api/base_response.dart';
import 'package:sknet_myadmin/http_api/request_interceptor.dart';
import 'package:sknet_myadmin/models/odp_model.dart';

import 'package:sknet_myadmin/utils/constans.dart';

part 'http_api.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient() {

    //displaying API LOG
    final prettyLogDio = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );

    final baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    );

    Dio? dio = Dio();
    dio.options = baseOptions;
    dio.interceptors.clear();
    dio.interceptors.add(RequestInterceptor());
    if(!kReleaseMode) {
      dio.interceptors.add(prettyLogDio);
    }
    
    return _ApiClient(dio, baseUrl: apiBaseUrl);
  }

  @GET('/odp')
  Future<BaseResponse<List<OdpModel>>> getOdp();
}
