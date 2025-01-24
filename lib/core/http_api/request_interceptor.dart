import 'dart:io';

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  final String apiKey;
  RequestInterceptor({required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['API-REQUEST-FROM'] = Platform.isIOS ? "IOS" : "Android";
    options.headers['key'] = apiKey;
    super.onRequest(options, handler);
  }
}


