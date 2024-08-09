import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/app/modules/third_screen/user_model.dart';

class UserProvider {
  final String _url = 'https://reqres.in/api/users?page=1&per_page=10';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(_url));

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<User> users = (jsonData['data'] as List).map((userJson) => User.fromJson(userJson),).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
