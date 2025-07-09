import 'package:fk_repository/data/typedefs.dart';

class FKDataParser<T> {
  const FKDataParser();
}

mixin FKFromMap<T> on FKDataParser<T> {
  T fromMap(FkJsonMap map);
}

mixin FKToMap<T> on FKDataParser<T> {
  FkJsonMap toMap(T entity);
}
