import 'package:example/features/user/domain/user.dart';
import 'package:example/features/user/domain/user_parser.dart';
import 'package:fk_booster/fk_booster.dart';

class UserRestParser implements UserParser {
  const UserRestParser();

  @override
  User fromMap(FkJsonMap map) {
    final data = map['data'] as Map<String, dynamic>;
    return User(
      uuid: data['id'] as String?,
      name: data['username'] as String?,
      email: data['email'] as String?,
      description: data['cellphone'] as String?,
    );
  }

  @override
  FkJsonMap toMap(User object) {
    return {
      'name': object.name,
      'email': object.email,
      'birthday': object.birthday?.toIso8601String(),
      'description': object.description,
    };
  }
}
