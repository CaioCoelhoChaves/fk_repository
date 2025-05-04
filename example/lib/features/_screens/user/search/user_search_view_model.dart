import 'package:example/features/_screens/user/search/user_search_view_state.dart';
import 'package:example/features/user/data/user_rest_repository.dart';
import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/cupertino.dart';

class UserSearchViewModel extends FkViewModel<UserSearchViewState> {
  UserSearchViewModel(this._repository) : super(const UserSearchViewState());

  final UserRestRepository _repository;
  final formKey = GlobalKey<FormState>();

  List<User> get users => value.users;

  late final FkCommand0 search = FkCommand0(() async {
    if (formKey.currentState!.validate()) {}
  });
}
