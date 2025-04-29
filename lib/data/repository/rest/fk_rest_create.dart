import 'package:fk_repository/data/repository/rest/fk_rest_repository.dart';
import 'package:fk_repository/data/typedefs.dart';
import 'package:fk_repository/domain/repository/fk_create.dart';
import 'package:flutter/foundation.dart';

mixin FkRestCreate<Entity, ReturnType extends Object>
    on FkRestRepository<Entity>
    implements FkCreate<Entity, ReturnType> {
  @protected
  String createEndpoint() => endpoint();

  @protected
  FkJsonMap createToMap(Entity entity);

  @protected
  ReturnType createFromMap(FkJsonMap map);

  @override
  Future<ReturnType> create(Entity entity) async {
    final response = await httpClient.post(
      createEndpoint(),
      data: createToMap(entity),
    );
    return createFromMap(response.data as Map<String, dynamic>);
  }
}
