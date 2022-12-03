import 'package:flutter/material.dart';

import '../users_list/models/users_list_model.dart';
import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;
  const UserListRow({
    super.key,
    required this.userModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: userModel.name!,
          ),
          Text(
            userModel.email!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
