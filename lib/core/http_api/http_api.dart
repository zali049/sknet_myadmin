import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sknet_myadmin/core/http_api/base_response.dart';
import 'package:sknet_myadmin/core/http_api/request_interceptor.dart';
import 'package:sknet_myadmin/models/customer/customer_model.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';
import 'package:sknet_myadmin/models/workorder/workorder_model.dart';
import 'package:sknet_myadmin/app/utils/constans.dart';

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
        headers: {
          'content-type': 'application/json',
        });

    Dio? dio = Dio();
    dio.options = baseOptions;
    dio.interceptors.clear();
    dio.interceptors.add(RequestInterceptor(apiKey: Constans.keyAPI));
    if (!kReleaseMode) {
      dio.interceptors.add(prettyLogDio);
    }

    return _ApiClient(
      dio,
      baseUrl: Constans.apiBaseUrl,
    );
  }

  @GET('/odp/')
  Future<BaseResponse<List<OdpModel>>> getOdp();
  @GET('/odp/{id}')
  Future<BaseResponse<OdpModel>> getOdpById(@Path('id') int id);
  @POST('/odp/')
  Future<BaseResponse> addOdp(@Body() OdpModel model);
  @DELETE('/odp/{id}')
  Future<void> deleteOdp(@Path('id') int id);
  @PUT("/odp/{id}")
  Future<BaseResponse> updateOdp(
    @Path('id') int id,
    @Body() OdpModel model,
  );

  /// Fungsi API mengelola Fitur Work Order
  @GET("/workorder/")
  Future<BaseResponse<List<WorkOrderModel>>> getWorkOrder();
  @POST("/workorder/")
  Future<BaseResponse> addWorkOrder(@Body() WorkOrderModel woModel);
  @DELETE("/workorder/{id}")
  Future<void> deleteWorkOrder(@Path('id') int id);
  @PUT("/workorder/{id}")
  Future<BaseResponse> updateWorkOrder(
    @Path('id') int id,
    @Body() WorkOrderModel woModel,
  );

  @GET("/customer/")
  Future<BaseResponse<List<WorkOrderModel>>> getCustomer();
  @POST("/workorder/")
  Future<BaseResponse> addCustomer(@Body() CustomerModel custModel);
  @DELETE("/workorder/{id}")
  Future<void> deleteCustomer(@Path('id') int id);
  @PUT("/workorder/{id}")
  Future<BaseResponse> updateCustomer(
    @Path('id') int id,
    @Body() CustomerModel custModel,
  );
}
