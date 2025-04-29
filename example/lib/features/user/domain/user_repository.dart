import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/fk_booster.dart';

abstract class UserRepository extends FkRepository<User>
    with FkCreate<User, User> {
  const UserRepository();
}
