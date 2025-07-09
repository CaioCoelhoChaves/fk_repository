import 'package:fk_repository/data/data_parser/fk_data_list_decode.dart';
import 'package:fk_repository/data/data_parser/fk_data_parser.dart';
import 'package:fk_repository/domain/entity/fk_paginated_entity.dart';
import 'package:fk_repository/domain/http/fk_http_client.dart';
import 'package:flutter/foundation.dart' show protected;

abstract class FKRepository {
  const FKRepository(this.httpClient);
  final FKHttpClient httpClient;

  String get url;

  @protected
  Future<FKPaginatedEntity<T>> getAllPaginated<T>({
    required FKFromMap<T> itemParser,
    String? endpoint,
  }) async {
    final response = await httpClient.get(_generatePath(endpoint));
    return FKPaginatedEntity(
      pagination: httpClient.paginationDecoder(response),
      items: fkDataListDecode(
        response.data as List<Map<String, dynamic>>,
        itemParser.fromMap,
      ),
    );
  }

  String _generatePath(String? endpoint) => '$url${endpoint ?? ''}';
}
