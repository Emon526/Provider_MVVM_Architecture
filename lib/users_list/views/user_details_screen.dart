import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/app_title.dart';
import '../view_models/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: userViewModel.selectedModel!.name!,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: userViewModel.selectedModel!.name!,
          ),
          Text(
            userViewModel.selectedModel!.email!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
