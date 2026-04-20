import '../data/models/product.dart';
import '../data/services/api_service.dart';

class ProductController {
  final ApiService _api = ApiService();

  Future<List<Product>> search(String keyword) {
    return _api.searchProducts(keyword);
  }
}