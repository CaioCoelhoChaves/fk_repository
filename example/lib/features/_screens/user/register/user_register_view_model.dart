import 'package:example/features/_screens/user/register/user_register_view_state.dart';
import 'package:example/features/user/data/user_rest_repository.dart';
import 'package:example/features/user/domain/user.dart';
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/cupertino.dart';

class UserRegisterViewModel extends FkViewModel<UserRegisterViewState> {
  UserRegisterViewModel(this._repository) : super(const UserRegisterViewState());

  final UserRestRepository _repository;
  final registerFormKey = GlobalKey<FormState>();

  User get user => value.user;
  set user(User user) => value = value.copyWith(user: user);

  late final FkCommand0 register = FkCommand0(() async {
    if (registerFormKey.currentState!.validate()) {
      final user = await _repository.create(value.user);
    }
  });
}
