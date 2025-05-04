import 'package:example/features/_screens/user/search/user_search_view_model.dart';
import 'package:example/features/user/data/user_rest_parser.dart';
import 'package:example/features/user/data/user_rest_repository.dart';
import 'package:fk_booster/fk_booster.dart';

class UserSearchInjection extends FkInjection<FkEmpty> {
  const UserSearchInjection() : super('search_screen');
  @override
  void call(GetIt i) {
    i.registerSingleton(
      UserRestRepository(
        httpClient: i.get<FkHttpClient>(),
        parser: UserRestParser(),
      ),
    );
    i.registerSingleton(UserSearchViewModel(i.get()));
  }
}
