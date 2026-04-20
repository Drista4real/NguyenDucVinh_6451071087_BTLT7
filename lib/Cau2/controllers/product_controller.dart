import '../data/services/api_service.dart';
import '../data/models/product.dart';

class ProductController {
  final ApiService _apiService = ApiService();

  Future<List<Product>> getProducts() {
    return _apiService.fetchProducts();
  }
}
