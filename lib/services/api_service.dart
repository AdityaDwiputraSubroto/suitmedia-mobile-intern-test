import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<List<User>> fetchUsers({int page = 1, int perPage = 10}) async {
    final url = Uri.parse('$baseUrl/users?page=$page&per_page=$perPage');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
