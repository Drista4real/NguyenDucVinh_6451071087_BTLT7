import 'package:flutter/material.dart';
import '../views/news_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}