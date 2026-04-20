import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  Future<void> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('https://69e66b8fce4e908a155f7f82.mockapi.io/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      print("Response: ${response.body}");
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }
}