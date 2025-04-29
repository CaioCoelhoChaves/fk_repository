import 'package:example/features/_screens/user/register/user_register_view.dart';
import 'package:example/features/_screens/user/register/user_register_injection.dart';
import 'package:example/features/_screens/user/register/user_register_view_model.dart';
import 'package:example/router/routes.dart';
import 'package:fk_booster/fk_booster.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.userRegister,
  routes: [
    FkRoute<UserRegisterViewModel, UserRegisterView, FkEmpty>(
      injection: const UserRegisterInjection(),
      path: Routes.userRegister,
      pageBuilder: (context, routeState, viewModel) {
        return UserRegisterView(viewModel: viewModel);
      },
    ),
  ],
);
