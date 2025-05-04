import 'package:example/core/widgets/text_input.dart';
import 'package:example/features/_screens/user/search/user_search_view_model.dart';
import 'package:example/features/user/domain/user.dart';
import 'package:example/router/routes.dart';
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/material.dart';

class UserSearchView extends FkView<UserSearchViewModel> {
  const UserSearchView({required super.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              const Text(
                'Users',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Gap.x(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextInput(
                      label: 'Name',
                      onChanged: (name) {
                        viewModel.value = viewModel.value.copyWith(
                          searchedName: name,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => viewModel.search,
                    icon: Icon(Icons.search),
                    iconSize: 36,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.users.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) return const _TableRow.header();
                    return _TableRow(user: viewModel.users[index - 1]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(Routes.userRegister),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({required this.user}) : isHeader = false;
  const _TableRow.header() : isHeader = true, user = const User();

  final User user;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return const Row(children: []);
  }
}
