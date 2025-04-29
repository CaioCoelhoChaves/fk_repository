part of '../user_register_view.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm(this.viewModel);
  final UserRegisterViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInput(
          required: true,
          label: 'Name',
          onChanged: (text) {
            viewModel.user = viewModel.user.copyWith(name: text);
          },
        ),
        const Gap.y(10),
        TextInput(
          required: true,
          label: 'Email',
          onChanged: (text) {
            viewModel.user = viewModel.user.copyWith(email: text);
          },
        ),
        const Gap.y(10),
        DateInput(
          required: true,
          label: 'Birthday',
          onChanged: (text) {
            viewModel.user = viewModel.user.copyWith(birthday: text);
          },
        ),
        const Gap.y(10),
        TextInput(
          required: true,
          label: 'Description',
          onChanged: (text) {
            viewModel.user = viewModel.user.copyWith(description: text);
          },
        ),
      ],
    );
  }
}
