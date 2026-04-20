import '../data/models/news.dart';
import '../data/services/api_service.dart';

class NewsController {
  final ApiService _api = ApiService();

  Future<List<News>> getNews() {
    return _api.fetchNews();
  }
}