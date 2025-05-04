import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/core/ui/fk_view_state.dart';

class UserSearchViewState extends FkViewState {
  const UserSearchViewState({this.searchedName = '', this.users = const []});

  final String searchedName;
  final List<User> users;

  UserSearchViewState copyWith({String? searchedName, List<User>? users}) {
    return UserSearchViewState(
      searchedName: searchedName ?? this.searchedName,
      users: users ?? this.users,
    );
  }
}
