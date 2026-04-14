import 'package:flutter/material.dart';
import '../views/user_list_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cau 1',
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}