import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import '../data/models/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final controller = TaskController();
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    tasks = await controller.getTasks();
    setState(() => isLoading = false);
  }

  void deleteTask(String id) async {
    await controller.deleteTask(id);

    setState(() {
      tasks.removeWhere((t) => t.id == id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Đã xóa task")),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Dismissible(
            key: Key(task.id),
            background: Container(color: Colors.red),
            onDismissed: (_) => deleteTask(task.id),
            child: ListTile(
              title: Text(task.title),
            ),
          );
        },
      ),
    );
  }
}