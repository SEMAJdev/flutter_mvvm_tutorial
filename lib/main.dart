import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_models/users_list/users_view_model.dart';
import 'package:provider/provider.dart';

import 'views/users_list/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsersViewModel()),
        ],
        child: MaterialApp(
          title: 'MVVM',
          // debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ));
  }
}
