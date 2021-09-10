import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:traffic_police/data/data_provider/user_secure_storage.dart';
import 'package:traffic_police/data/models/role.dart';

class RoleDataProvider {
  String? token;
  Future<String> getToken() async {
    var token = await UserSecureStorage.getToken();
    print('token getter: $token');
    return "Bearer $token";
  }

  final _baseUrl = 'http://192.168.122.1:5000/api/';

  Future<Role> createRole(Role role) async {
    try {
      token = await getToken();
      final response = await http.post(
        Uri.parse('$_baseUrl/roles'),
        headers: <String, String>{
          "authorization": "$token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': role.name.toUpperCase(),
        }),
      );

      if (response.statusCode == 200) {
        return Role.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create Role');
      }
    } catch (error) {
      print(error);
      return Role(id: "id", name: "name");
    }
  }

  Future<List<Role>> getRoles() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/roles'),
    );

    if (response.statusCode == 200) {
      final roles = jsonDecode(response.body) as List;
      return roles.map((role) => Role.fromJson(role)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }

  Future<void> deleteRole(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$_baseUrl/roles'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to delete role');
    }
  }
}
