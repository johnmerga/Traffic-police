import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traffic_police/data/data_provider/user_secure_storage.dart';
import 'package:traffic_police/data/models/models.dart';

class CourseDataProvider {
  static final String _baseUrl = "http://192.168.122.1:5000/api/Officer";

  Future<String> getToken() async {
    var token = await UserSecureStorage.getToken();
    print('token getter: $token');
    return "Bearer $token";
  }

  Future<Officer> create(Officer officer) async {
    var tk = await getToken();
    final http.Response response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': '$tk'
      },
      body: jsonEncode(
        {
          'isadmin': officer.is_admin,
          'birthOfDate': officer.birthOfDate,
          'firstName': officer.firstName,
          'lastName': officer.lastName,
          'position': officer.position,
          'sex': officer.sex,
          'state': officer.state,
          'phoneNumber': officer.phoneNumber,
          'email': officer.email,
          'password': officer.password,
          'startDate': officer.startDate,
        },
      ),
    );
    if (response.statusCode == 201) {
      return Officer.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create course");
    }
  }

  Future<Officer> fetchByCode() async {
    var tk = await getToken();

    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': '$tk'
      },
    );

    if (response.statusCode == 200) {
      return Officer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Course by code failed");
    }
  }

  Future<List<Officer>> fetchAll() async {
    var tk = await getToken();
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': '$tk'
      },
    );
    if (response.statusCode == 200) {
      final officer = jsonDecode(response.body) as List;
      return officer.map((_) => Officer.fromJson(_)).toList();
    } else {
      throw Exception("Could not fetch courses");
    }
  }

  Future<Officer> update(String id, Officer officer) async {
    var tk = await getToken();
    final response = await http.put(
      Uri.parse("$_baseUrl/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': '$tk'
      },
      body: jsonEncode(
        {
          'isadmin': officer.is_admin,
          'birthOfDate': officer.birthOfDate,
          'firstName': officer.firstName,
          'lastName': officer.lastName,
          'position': officer.position,
          'sex': officer.sex,
          'state': officer.state,
          'phoneNumber': officer.phoneNumber,
          'email': officer.email,
          'password': officer.password,
          'startDate': officer.startDate,
        },
      ),
    );

    if (response.statusCode == 200) {
      return Officer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(String id) async {
    var tk = await getToken();
    final response = await http.delete(
      Uri.parse("$_baseUrl/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': '$tk'
      },
    );
    if (response.statusCode != 204) {
      throw Exception("Field to delete the course");
    }
  }
}
