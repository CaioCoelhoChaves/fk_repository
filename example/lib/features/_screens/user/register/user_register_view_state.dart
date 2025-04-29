import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/core/ui/fk_view_state.dart';

class UserRegisterState extends FkViewState {
  const UserRegisterState({this.user = const User()});

  final User user;

  UserRegisterState copyWith({User? user}) {
    return UserRegisterState(user: user ?? this.user);
  }
}
