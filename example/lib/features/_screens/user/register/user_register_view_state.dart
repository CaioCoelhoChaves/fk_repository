import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/core/ui/fk_view_state.dart';

class UserRegisterViewState extends FkViewState {
  const UserRegisterViewState({this.user = const User()});

  final User user;

  UserRegisterViewState copyWith({User? user}) {
    return UserRegisterViewState(user: user ?? this.user);
  }
}
