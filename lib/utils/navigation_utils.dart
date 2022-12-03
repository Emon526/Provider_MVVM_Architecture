import 'package:flutter/material.dart';

import '../users_list/views/add_user_screen.dart';
import '../users_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const UserDetailsScreen(),
    ),
  );
}

void openAddUser(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AddUserScreen(),
    ),
  );
}
