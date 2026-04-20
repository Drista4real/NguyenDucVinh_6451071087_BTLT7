import '../data/models/task.dart';
import '../data/services/api_service.dart';

class TaskController {
  final ApiService _api = ApiService();

  Future<List<Task>> getTasks() => _api.fetchTasks();

  Future<void> deleteTask(String id) => _api.deleteTask(id);
}
