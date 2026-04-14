import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://69dda53e410caa3d47b9b5c1.mockapi.io/User'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }
}