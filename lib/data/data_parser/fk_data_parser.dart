import 'package:fk_repository/data/typedefs.dart';

class FkDataParser<T> {
  const FkDataParser();
}

abstract class FkFullDataParser<T> extends FkDataParser<T>
    with ToMap, FromMap {}

mixin FromMap<T> on FkDataParser<T> {
  T fromMap(FkJsonMap map);
}

mixin ToMap<T> on FkDataParser<T> {
  FkJsonMap toMap(T entity);
}
