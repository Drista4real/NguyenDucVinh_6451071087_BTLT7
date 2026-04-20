import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class ApiService {
  final String baseUrl =
      'https://69e67909ce4e908a155f8e1e.mockapi.io/news';

  Future<List<News>> fetchNews() async {
    final res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      List data = json.decode(res.body);
      return data.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Load failed');
    }
  }
}