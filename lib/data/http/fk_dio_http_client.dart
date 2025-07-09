import 'package:dio/dio.dart';
import 'package:fk_repository/domain/entity/fk_paginated_entity.dart';
import 'package:fk_repository/domain/http/fk_http_client.dart';
import 'package:fk_repository/domain/http/fk_http_exception.dart';
import 'package:fk_repository/domain/http/fk_http_response.dart';

class FKDioHttpClient implements FKHttpClient {
  FKDioHttpClient({
    required String baseUrl,
    required this.paginationDecoder,
    this.responseWrapperDecoder,
    Map<String, dynamic>? defaultHeaders,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      headers: defaultHeaders,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    _dio = Dio(options);
  }

  @override
  final FKPagination Function(FKHttpResponse) paginationDecoder;
  @override
  final dynamic Function(dynamic)? responseWrapperDecoder;

  late final Dio _dio;

  @override
  Future<FKHttpResponse> post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _execute(
      () => _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<FKHttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _execute(
      () => _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<FKHttpResponse> put(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _execute(
      () => _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<FKHttpResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _execute(
      () => _dio.delete<dynamic>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<FKHttpResponse> patch(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return _execute(
      () => _dio.patch<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  Future<FKHttpResponse> _execute(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      final response = await request();
      return FKHttpResponse(
        data: responseWrapperDecoder?.call(response.data) ?? response.data,
        statusCode: response.statusCode,
        headers: response.headers.map,
      );
    } on DioException catch (e) {
      throw FKHttpException(error: e, message: e.message);
    }
  }
}
