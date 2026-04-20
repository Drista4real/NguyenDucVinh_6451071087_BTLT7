import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../data/models/user.dart';

class UpdateUserScreen extends StatefulWidget {
  final String userId;

  // Bỏ required và gán giá trị mặc định là "1" (hoặc bất kỳ ID nào bạn muốn)
  const UpdateUserScreen({super.key, this.userId = "1"});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final controller = UserController();
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  void loadUser() async {
    try {
      final user = await controller.getUser(widget.userId);
      if (mounted) {
        nameCtrl.text = user.name;
        emailCtrl.text = user.email;
        phoneCtrl.text = user.phone;
        setState(() => isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi tải thông tin: $e")),
        );
      }
    }
  }

  void updateUser() async {
    if (!_formKey.currentState!.validate()) return;

    final updatedUser = User(
      id: widget.userId,
      name: nameCtrl.text,
      email: emailCtrl.text,
      phone: phoneCtrl.text,
    );

    try {
      final result = await controller.updateUser(widget.userId, updatedUser);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Update thành công")),
        );

        nameCtrl.text = result.name;
        emailCtrl.text = result.email;
        phoneCtrl.text = result.phone;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Update User")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (v) => v!.isEmpty ? "Nhập name" : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateUser,
                child: const Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
