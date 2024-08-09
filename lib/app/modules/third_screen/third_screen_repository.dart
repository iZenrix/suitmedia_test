import 'package:suitmedia_test/app/modules/third_screen/third_screen_provider.dart';
import 'package:suitmedia_test/app/modules/third_screen/user_model.dart';

class UserRepository {
  final UserProvider _provider = UserProvider();

  Future<List<User>> getUsers() async {
    final response = await _provider.fetchUsers();
    return response;
  }
}
