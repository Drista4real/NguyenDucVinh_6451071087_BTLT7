import 'package:flutter/material.dart';
import '../views/user_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cau 4',
      debugShowCheckedModeBanner: false,
      home: UserListScreen(), // Đổi từ Update sang List để hiện toàn bộ danh sách
    );
  }
}
