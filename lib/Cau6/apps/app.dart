import 'package:flutter/material.dart';
import '../views/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}