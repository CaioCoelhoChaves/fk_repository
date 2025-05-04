import 'package:fk_repository/domain/http/fk_http_client.dart';
import 'package:fk_repository/domain/repository/fk_repository.dart';
import 'package:flutter/material.dart';

abstract class FkRestRepository<Entity> extends FkRepository<Entity> {
  const FkRestRepository({required this.httpClient, required super.parser});

  @protected
  final FkHttpClient httpClient;

  @protected
  String endpoint();
}
