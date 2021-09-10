import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;
import 'package:traffic_police/data/models/models.dart';

class OfficerDataProvider {
  OfficerDataProvider({required this.httpClient, required this.token})
      : super();

  String token;

  final _baseUrl = 'http://192.168.122.1:5000/api/';

  final http.Client httpClient;

  Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "jwt_token");
    return "Bearer $token";
  }

  Future<Officer> createOfficer(Officer officer) async {
    token = await getToken();

    var data = {

      "id": officer.id,
      "is_admin": officer.is_admin,
      "birthOfDate": officer.birthOfDate,
      "firstName": officer.firstName,
      "lastName": officer.lastName,
      "position": officer.position,
      "sex": officer.sex,
      "state": officer.state,
      "phoneNumber": officer.phoneNumber,
      "email": officer.email,
      "password": officer.password,
      "startDate": officer.startDate,
    };
    try {
      final response = await http.post(Uri.parse("$_baseUrl/${token}"),
          headers: <String, String>{
            "authorization": "$token",
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 201) {
        print(response.body);
        return officer;
        //Job.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create Officer.');
      }
    } catch (e, st) {
      throw Exception('Failed to create Officer.');
    }
  }

  Future<List<Officer>> getOfficersByCategory(String categoryId) async {
    final response = await http.get(
      Uri.http(_baseUrl, "/$categoryId/officers"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode == 200) {
      final officers = jsonDecode(response.body) as List;
      return officers.map((job) => Officer.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load officers');
    }
  }

  Future<List<Officer>> getOfficersByCompanyId(String companyId) async {
    final response = await http.get(Uri.parse("$_baseUrl/${token}"));

    if (response.statusCode == 200) {
      final officers = jsonDecode(response.body) as List;
      List<Officer> officerList =
          officers.map((officer) => Officer.fromJson(officer)).toList();

      return officerList;
    } else {
      throw Exception('Failed to load officers');
    }
  }

  Future<List<Officer>> getOfficers() async {
    final response = await http.get(Uri.parse("$_baseUrl/${token}"));

    if (response.statusCode == 200) {
      final officers = jsonDecode(response.body) as List;
      List<Officer> officerList =
          officers.map((officer) => Officer.fromJson(officer)).toList();

      return officerList;
    } else {
      throw Exception('Failed to load officers');
    }
  }

  Future<Officer> getOfficer(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/${token}"));

    if (response.statusCode == 200) {
      var officer = jsonDecode(response.body);
      Officer selectedOfficer = Officer.fromJson(officer);

      return selectedOfficer;
    } else {
      throw Exception('Failed to load officers');
    }
  }

  Future<Officer?> updateOfficer(String id, Officer officer) async {
    token = await getToken();

    var data = {
      "id": officer.id,
      "is_admin": officer.is_admin,
      "birthOfDate": officer.birthOfDate,
      "firstName": officer.firstName,
      "lastName": officer.lastName,
      "position": officer.position,
      "sex": officer.sex,
      "state": officer.state,
      "phoneNumber": officer.phoneNumber,
      "email": officer.email,
      "password": officer.password,
      "startDate": officer.startDate,
      /*"name": job.name,
      "description": job.description,
      "other_info": job.otherInfo,
      "experience_level": job.experienceLevel,
      "job_position": job.jobPosition,
      "deadline": job.deadline.toString(),
      "job_type": job.jobType,
      "job_category_id": job.categoryId.toString(),
      "date_published": job.datePublished.toString(),
      "company_id": job.companyId*/
    };

    try {
      final response = await http.put(Uri.parse("$_baseUrl/${token}"),
          headers: <String, String>{
            "authorization": "$token",
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 201) {
        return Officer.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to Officer.');
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteOfficer(String id) async {
    token = await getToken();

    final response = await http.delete(
      Uri.parse("$_baseUrl/${token}"),
      headers: <String, String>{
        "authorization": "$token",
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // return Officer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete officer.');
    }
  }
}
