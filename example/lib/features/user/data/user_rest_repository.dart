import 'package:example/features/user/domain/user.dart';
import 'package:example/features/user/domain/user_repository.dart'
    show UserRepository;
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/foundation.dart' show protected;

class UserRestRepository extends FkRestRepository<User>
    with FkRestCreate
    implements UserRepository {
  const UserRestRepository({required super.httpClient, required super.parser});

  @protected
  @override
  String endpoint() => '/users';
}
