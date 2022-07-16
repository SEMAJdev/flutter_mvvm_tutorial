import 'package:flutter/material.dart';
import 'package:mvvm_provider/models/users_list/users_list_model.dart';
import 'package:mvvm_provider/utilities/navigation_utils.dart';
import 'package:mvvm_provider/view_models/users_list/users_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/app_error.dart';
import '../../components/app_loading.dart';
import '../../components/user_list_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(onPressed: () async {
            openAddUser(context);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [_ui(usersViewModel)],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    final userError = usersViewModel.userError;
    if (userError != null) {
      return AppError(
        errortxt: userError.message.toString(),
      );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
                onTap: () async {
                  usersViewModel.setSelectedUser(userModel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: usersViewModel.userListModel.length
        )
    );
  }
}
