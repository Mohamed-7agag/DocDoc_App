import 'package:dio/dio.dart';
import 'package:doctors_app/core/api/api_requests.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices implements ApiRequests {
  final Dio _dio;

  /// Creates an instance of [ApiServices] with the provided [Dio] instance.
  ApiServices(this._dio) {
    _dio
      ..options.baseUrl = EndPoint.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
  }

//! Get Request
  @override
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

//! Post Request
  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

//! Delete Request
  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

//! Patch Request
  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }
}
