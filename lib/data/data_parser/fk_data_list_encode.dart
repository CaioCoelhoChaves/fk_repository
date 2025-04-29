import 'package:fk_repository/data/typedefs.dart';

FkJsonList fkDataListEncode<T>(
  List<T> items,
  FkJsonMap Function(T entity) fromEntity,
) {
  return items.map((e) => fromEntity(e)).toList();
}
