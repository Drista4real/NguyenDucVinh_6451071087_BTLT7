import '../data/models/post.dart';
import '../data/services/api_service.dart';

class PostController {
  final ApiService _apiService = ApiService();

  Future<void> createPost(String title, String content) async {
    final post = Post(title: title, content: content);
    await _apiService.createPost(post);
  }
}