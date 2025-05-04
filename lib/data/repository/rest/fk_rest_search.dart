// import 'package:fk_repository/data/repository/rest/fk_rest_repository.dart';
// import 'package:fk_repository/data/typedefs.dart';
// import 'package:fk_repository/domain/repository/fk_search.dart';
// import 'package:flutter/foundation.dart';
//
// mixin FkRestCreate<Entity, SearchEntity> on FkRestRepository<Entity>
// implements FkSearch<Entity, SearchEntity> {
//   @protected
//   String createEndpoint() => endpoint();
//
//   @protected
//   FkJsonMap searchToMap(Entity entity) => parser.toMap(entity);
//
//   @protected
//   Entity searched FromMap(FkJsonMap map) => parser.fromMap(map);
//
//   @override
//   Future<Entity> create(Entity entity) async {
//     final response = await httpClient.post(
//       createEndpoint(),
//       data: createToMap(entity),
//     );
//     return createFromMap(response.data as Map<String, dynamic>);
//   }
// }
