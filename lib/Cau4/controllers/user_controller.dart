import '../data/models/user.dart';
import '../data/services/api_service.dart';

class UserController {
  final ApiService _api = ApiService();

  // Thêm hàm này để lấy toàn bộ danh sách
  Future<List<User>> getUsers() {
    return _api.getUsers();
  }

  Future<User> getUser(String id) {
    return _api.getUser(id);
  }

  Future<User> updateUser(String id, User user) {
    return _api.updateUser(id, user);
  }
}
