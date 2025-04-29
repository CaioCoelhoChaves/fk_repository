import 'package:fk_repository/data/typedefs.dart';

List<T> fkDataListDecode<T>(
  FkJsonList items,
  T Function(FkJsonMap map) fromMap,
) {
  return items.map((e) => fromMap(e)).toList();
}
