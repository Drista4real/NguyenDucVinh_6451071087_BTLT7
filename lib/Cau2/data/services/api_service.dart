import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://69ddbb97410caa3d47b9e4f8.mockapi.io/Product'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }
}