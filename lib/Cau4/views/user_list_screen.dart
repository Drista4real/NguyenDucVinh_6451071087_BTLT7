import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../data/models/user.dart';
import 'update_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: FutureBuilder<List<User>>(
        future: controller.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Chuyển sang màn hình update khi nhấn nút sửa
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserScreen(userId: user.id),
                      ),
                    ).then((_) {
                      // Load lại danh sách sau khi quay về từ màn hình sửa
                      setState(() {});
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
