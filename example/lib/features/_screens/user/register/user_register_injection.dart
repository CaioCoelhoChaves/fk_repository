import 'package:example/features/_screens/user/register/user_register_view_model.dart';
import 'package:example/features/user/data/user_rest_parser.dart';
import 'package:example/features/user/data/user_rest_repository.dart';
import 'package:fk_booster/fk_booster.dart';

class UserRegisterInjection extends FkInjection<FkEmpty> {
  const UserRegisterInjection() : super('register_screen');
  @override
  void call(GetIt i) {
    i.registerSingleton(
      UserRestRepository(
        httpClient: i.get<FkHttpClient>(),
        parser: UserRestParser(),
      ),
    );
    i.registerSingleton(UserRegisterViewModel(i.get()));
  }
}
