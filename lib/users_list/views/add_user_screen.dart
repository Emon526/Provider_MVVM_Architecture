import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/users_view_model.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await userViewModel.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (value) async {
                userViewModel.addingUser.name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (value) async {
                userViewModel.addingUser.email = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
