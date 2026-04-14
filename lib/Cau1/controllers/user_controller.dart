import '../data/services/api_service.dart';
import '../data/models/user.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<List<User>> getUsers() {
    return _apiService.fetchUsers();
  }
}