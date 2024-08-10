import 'package:suitmedia_test/app/modules/third_screen/provider/third_screen_provider.dart';
import 'package:suitmedia_test/app/modules/third_screen/model/user_model.dart';

class UserRepository {
  final UserProvider _provider = UserProvider();

  Future<List<User>> getUsers({int page = 1, int perPage = 10}) async {
    final response = await _provider.fetchUsers(page: page, perPage: perPage);
    return response;
  }
}
