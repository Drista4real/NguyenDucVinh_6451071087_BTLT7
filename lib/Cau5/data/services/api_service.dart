import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  final String baseUrl =
      'https://69e67359ce4e908a155f87cb.mockapi.io/tasks';

  // GET list
  Future<List<Task>> fetchTasks() async {
    final res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      List data = json.decode(res.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception('GET failed');
    }
  }

  // DELETE
  Future<void> deleteTask(String id) async {
    final res = await http.delete(Uri.parse('$baseUrl/$id'));

    if (res.statusCode != 200) {
      throw Exception('DELETE failed');
    }
  }
}