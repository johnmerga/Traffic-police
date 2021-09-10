import 'dart:convert';

import 'package:traffic_police/data/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OfficerDataProvider {
  final _baseUrl = 'http://10.0.2.2:8383/api';
  http.Client? httpClient;
  String? token;

  Future<String> getToken() async {
    final storage = FlutterSecureStorage();
    var token = await storage.read(key: "jwt_token");
    return "Bearer $token";
  }

  Future<Officer> createOfficer(Officer officer) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        '_id': officer.id,
        '_isadmin': officer.is_admin,
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
      }),
    );

    if (response.statusCode == 200) {
      return Officer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Officer');
    }
  }

  Future<List<Officer>> getOfficers() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/Officers"));
      if (response.statusCode == 200) {
        final officers = jsonDecode(response.body) as List;
        final result = officers.map((officer) {
          var resultOfficer = Officer.fromJson(officer);
          return resultOfficer;
        }).toList();
        return result;
      } else {
        throw Exception('Failed to load Officers');
      }
    } catch (err) {
      print("the error is $err");
      return [];
    }
  }

  Future<void> updateOfficer(Officer officer) async {
    token = await getToken();

    final http.Response response = await http.put(
      Uri.parse('$_baseUrl/Officers/${officer.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "authorization": "$token",
      },
      body: jsonEncode(<String, dynamic>{
        '_id': officer.id,
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
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to update Officer');
    }  
    Future<void> deleteOfficer(String id) async {
    token = await getToken();

    final http.Response response = await http.delete(
      Uri.parse('$_baseUrl/Officers/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "authorization": "$token",
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to delete Officer');
    }
  }
  // Future<Officer> updateOfficerRole(String OfficerId, String roleId) async {
  //   token = await getToken();

  //   final response = await http.put(
  //     Uri.parse('$_baseUrl/Officers/$OfficerId/is_admin'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       "authorization": "$token",
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'role_id': roleId,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     return Officer.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create Officer');
  //   }
  // }
  }




}
