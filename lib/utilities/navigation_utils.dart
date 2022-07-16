import 'package:flutter/material.dart';
import 'package:mvvm_provider/views/users_list/user_details_screen.dart';

import '../views/users_list/add_user_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserDetailsScreen()
      )
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddUserScreen()
      )
  );
}
