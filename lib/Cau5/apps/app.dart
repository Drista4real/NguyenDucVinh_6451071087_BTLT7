import 'package:flutter/material.dart';
import '../views/task_list_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}