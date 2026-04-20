import 'package:flutter/material.dart';
import '../views/product_detail_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cau 2',
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(),
    );
  }
}