// ignore_for_file: unused_field, unused_catch_clause, unused_element

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

enum ApiCallStatus {
  loading,
  success,
  error,
  empty,
  holding,
  cache,
  refresh,
}

class BaseClient {
  static final Dio _dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }));

  static const int _timeoutInSeconds = 10;

  static get dio => _dio;

  static allApiCall(
      String url,
      RequestType requestType, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        required Function(Response response) onSuccess,
        Function(dynamic)? onError,
        Function(int value, int progress)? onReceiveProgress,
        Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
        Function? onLoading,
        dynamic data,
      }) async {
    try {
      await onLoading?.call();
      late Response response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            // headers: headers,
              headers: {
                'X-RapidAPI-Key':
                '6145aad6ecmshd8251a496cfaab9p1d1c4cjsn03be12698bcf',
                'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
              }),
        );
      }

      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      // print("DioException${error}");
      await onError!(error);
    } on SocketException {
      // No internet connection
      await onError!('');

      // print("SocketException");
    } on TimeoutException {
      // Api call went out of time
      //  print("TimeoutException");
      //stackTrace
    } catch (error) {
      // print the line of code that throw unexpected exception
      await onError!(error);
      // Logger().e(stackTrace);
      //  Logger().e(error);
      // unexpected error for example (parsing json error)
      //   _handleUnexpectedException(url: url, onError: onError, error: error);
    }
  }
}
