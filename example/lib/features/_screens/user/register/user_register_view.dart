import 'package:example/core/widgets/date_input.dart';
import 'package:example/core/widgets/text_input.dart';
import 'package:example/features/_screens/user/register/user_register_view_model.dart';
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/material.dart';

part 'widgets/register_submit_button.dart';
part 'widgets/register_form.dart';

class UserRegisterView extends FkView<UserRegisterViewModel> {
  const UserRegisterView({required super.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: viewModel.registerFormKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: context.pop,
                    icon: Icon(Icons.chevron_left, size: 40),
                  ),
                ),
                const Text(
                  'Create User',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Gap.y(15),
                _RegisterForm(viewModel),
                const Gap.y(25),
                _SubmitButton(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
