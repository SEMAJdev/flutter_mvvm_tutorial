import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../view_models/users_list/users_view_model.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        actions: [
          IconButton(onPressed: () async {
            bool userAdded = (await usersViewModel.addUser());
            if(!userAdded){
              return;
            }
            Navigator.pop(context);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name"
              ),
              onChanged: (val) async {
                usersViewModel.addingUser!.name = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              onChanged: (val) async {
                usersViewModel.addingUser!.email = val;
              },
            )
          ],
        ),
      ),
    );
  }
}
