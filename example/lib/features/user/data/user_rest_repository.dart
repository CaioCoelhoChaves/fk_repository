import 'package:example/features/user/domain/user.dart';
import 'package:example/features/user/domain/user_parser.dart';
import 'package:example/features/user/domain/user_repository.dart'
    show UserRepository;
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/foundation.dart' show protected;

class UserRestRepository extends FkRestRepository<User>
    with FkRestCreate<User, User>
    implements UserRepository {
  const UserRestRepository({required super.httpClient, required this.parser});

  final UserParser parser;

  @protected
  @override
  String endpoint() => '/users';

  @protected
  @override
  User createFromMap(FkJsonMap map) => parser.fromMap(map);

  @protected
  @override
  FkJsonMap createToMap(User entity) => parser.toMap(entity);
}
