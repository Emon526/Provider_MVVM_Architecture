import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../components/app_error.dart';
import '../../components/app_loading.dart';
import '../../components/app_title.dart';
import '../../components/user_list_row.dart';
import '../../utils/navigation_utils.dart';
import '../models/users_list_model.dart';
import '../view_models/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AppTitle(
          title: 'Users',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _ui(userViewModel),
        ],
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }
    if (userViewModel.userError != null) {
      return AppError(
        errorText: userViewModel.userError!.message!.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = userViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              userViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: userViewModel.userListModel.length,
      ),
    );
  }
}
