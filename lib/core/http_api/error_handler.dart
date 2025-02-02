import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:sknet_myadmin/app/utils/logger.dart';

class ErrorHandler implements Exception {
  RxString _errorMessage = ''.obs;

  ErrorHandler(this._errorMessage);

  ErrorHandler.dioException({required DioException error}) {
    _handlerDioException(error);
  }

  ErrorHandler.otherException() {
    _handleOtherException();
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleOtherException() {
    _errorMessage.value = 'Something went wrong';
    ErrorHandler serveError = ErrorHandler(_errorMessage);
    return serveError;
  }

  _handlerDioException(DioException error) {
    ErrorHandler serverError;
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage.value = 'Dio Canceled';
        serverError = ErrorHandler(_errorMessage);
        break;

      case DioExceptionType.connectionTimeout:
        _errorMessage.value = 'Dio Request Timeout';
        serverError = ErrorHandler(_errorMessage);
        break;

      case DioExceptionType.receiveTimeout:
        _errorMessage.value = "Received timeout";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 503) {
          _errorMessage.value = "Something went wrong";
          serverError = ErrorHandler(_errorMessage);
        } else if (error.response?.statusCode != 401) {
          _errorMessage.value = handleBadRequest(error.response?.data);
          serverError = ErrorHandler(_errorMessage);
        } else {
          _errorMessage.value = "UnAuthorized";
          serverError = ErrorHandler(_errorMessage);
        }
        break;
      case DioExceptionType.unknown: 
        Logger.log(msg: 'Called here unknown');
        _errorMessage.value = "Something went wrong";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.sendTimeout:
        if (kReleaseMode) {
          _errorMessage.value = "Something went wrong";
        } else {
          _errorMessage.value = "Received timeout";
        }
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.connectionError:
        _errorMessage.value = "No Internet connection";
        serverError = ErrorHandler(_errorMessage);
        break;
      default:
        _errorMessage.value =
            error.response?.statusMessage ?? "Something went wrong";
        serverError = ErrorHandler(_errorMessage);
        break;
    }
    return serverError;
  }

  String handleBadRequest(Map<String, dynamic>? errorData ){
    String error = '';
    if(errorData?['error_decription'] != null){
      final message = errorData?['error_decription'];
      error = message;
    } else if(errorData?['error']) {
      try{
        final errorObject = errorData?['error'];
        final message = errorObject['message'];
        final dynamic errorTag = message.keys.first;
        error = message[errorTag];
      } catch (e) {
        error = errorData?['error'] ['message'] ?? "";
      }
    } else if (errorData?['errors'] == null &&  errorData?.entries != null) {
      for(var item in errorData!.entries) {
        error = item.value.toString();
        break;
      }
    } else {
      error = "something went wrong";
    }
    return error;
  }
}
