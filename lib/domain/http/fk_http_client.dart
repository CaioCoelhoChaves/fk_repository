import 'package:fk_repository/domain/entity/fk_paginated_entity.dart';
import 'fk_http_response.dart';

abstract class FKHttpClient {
  const FKHttpClient({
    required this.paginationDecoder,
    this.responseWrapperDecoder,
  });

  final FKPagination Function(FKHttpResponse) paginationDecoder;
  final dynamic Function(FKHttpResponse)? responseWrapperDecoder;

  Future<FKHttpResponse> post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<FKHttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<FKHttpResponse> put(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<FKHttpResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<FKHttpResponse> patch(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
