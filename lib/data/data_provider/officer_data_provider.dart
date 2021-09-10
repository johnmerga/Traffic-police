// import 'dart:convert';

// import 'package:traffic_police/data/models/models.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;

// class OfficerDataProvider {
//   final _baseUrl = 'http://10.0.2.2:8383/api';
//   http.Client ?httpClient;
//   String ?token;

//   Future<String> getToken() async {
//     final storage = FlutterSecureStorage();
//     var token = await storage.read(key: "jwt_token");
//     return "Bearer $token";
//   }

//   Future<Officer> createOfficer(Officer Officer) async {
//     final response = await http.post(
//       '$_baseUrl',
//       headers: <String, String>{  
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//       '_id': Officer.id,
//       '_isadmin': Officer.is_admin,
//       'birthOfDate': Officer.birthOfDate,
//       'firstName': Officer.firstName,
//       'lastName': Officer.lastName,
//       'position': Officer.position,
//       'sex': Officer.sex,
//       'state': Officer.state,
//       'phoneNumber': Officer.phoneNumber,
//       'email': Officer.email,
//       'password': Officer.password,
//       'startDate': Officer.startDate,
//       }),
//     );

//     if (response.statusCode == 200) {
      
//       return Officer.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create Officer');
//     }
//   }

//   Future<List<Officer>> getOfficers() async {
//     try {
//       final response = await http.get("$_baseUrl/Officers");
//       if (response.statusCode == 200) {
//         final Officers = jsonDecode(response.body) as List;
//         final result = Officers.map((Officer) {
//           var resultOfficer = Officer.fromJson(Officer);
//           return resultOfficer;
//         }).toList();
//         return result;
//       } else {
//         throw Exception('Failed to load Officers');
//       }
//     } catch (err) {
//       print("the error is $err");
//       return null;
//     }
//   }

//   Future<void> updateOfficer(Officer Officer) async {
//     token = await getToken();

//     final http.Response response = await http.put(
//       '$_baseUrl/Officers/${Officer.id}',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "authorization": "$token",
//       },
//       body: jsonEncode(<String, dynamic>{
//       '_id': Officer.id,
//       '_isadmin': Officer.is_admin,
//       'birthOfDate': Officer.birthOfDate,
//       'firstName': Officer.firstName,
//       'lastName': Officer.lastName,
//       'position': Officer.position,
//       'sex': Officer.sex,
//       'state': Officer.state,
//       'phoneNumber': Officer.phoneNumber,
//       'email': Officer.email,
//       'password': Officer.password,
//       'startDate': Officer.startDate,
//       }),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to update Officer');
//     }
//   }

//   Future<Officer> updateOfficerRole(String OfficerId, String roleId) async {
//     token = await getToken();

//     final response = await http.put(
//       '$_baseUrl/Officers/$OfficerId/changerole',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "authorization": "$token",
//       },
//       body: jsonEncode(<String, dynamic>{
//         'role_id': roleId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return Officer.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create Officer');
//     }
//   }

//   Future<void> deleteOfficer(String id) async {
//     token = await getToken();

//     final http.Response response = await http.delete(
//       '$_baseUrl/Officers/$id',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "authorization": "$token",
//       },
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to delete Officer');
//     }
//   }
// }
