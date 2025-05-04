import 'package:example/features/_screens/user/register/user_register_view.dart';
import 'package:example/features/_screens/user/register/user_register_injection.dart';
import 'package:example/features/_screens/user/register/user_register_view_model.dart';
import 'package:example/features/_screens/user/search/user_search_view_model.dart';
import 'package:example/router/paths.dart';
import 'package:example/router/routes.dart';
import 'package:fk_booster/fk_booster.dart';

import '../features/_screens/user/search/user_register_injection.dart';
import '../features/_screens/user/search/user_search_view.dart';

final GoRouter router = GoRouter(
  initialLocation: Paths.user,
  routes: [
    FkRoute<UserSearchViewModel, UserSearchView, FkEmpty>(
      injection: const UserSearchInjection(),
      path: Paths.user,
      name: Routes.userSearch,
      pageBuilder: (context, routeState, viewModel) {
        return UserSearchView(viewModel: viewModel);
      },
      routes: [
        FkRoute<UserRegisterViewModel, UserRegisterView, FkEmpty>(
          injection: const UserRegisterInjection(),
          path: Paths.register,
          name: Routes.userRegister,
          pageBuilder: (context, routeState, viewModel) {
            return UserRegisterView(viewModel: viewModel);
          },
        ),
      ],
    ),
  ],
);
