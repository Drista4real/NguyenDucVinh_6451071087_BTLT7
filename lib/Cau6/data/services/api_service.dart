import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  final String baseUrl =
      'https://69e676a8ce4e908a155f8b55.mockapi.io/products';

  Future<List<Product>> searchProducts(String keyword) async {
    final response = await http.get(
      Uri.parse('$baseUrl?search=$keyword'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Search failed: ${response.statusCode}');
    }
  }
}