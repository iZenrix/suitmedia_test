import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/app/modules/third_screen/model/user_model.dart';

class UserProvider {
  final String _baseUrl = 'https://reqres.in/api/users';

  Future<List<User>> fetchUsers({int page = 1, int perPage = 10}) async {
    final response = await http.get(Uri.parse('$_baseUrl?page=$page&per_page=$perPage'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<User> users = (jsonData['data'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}