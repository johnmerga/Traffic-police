import 'dart:convert';
import 'package:traffic_police/data/data_provider/user_secure_storage.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:traffic_police/exceptions/exception.dart';

class AuthenticationDataProvider {
  final _baseUrl = "http://192.168.122.1:5000/api";
  Map<String, dynamic> officer_map = {};
  String? token;

  Future<Officer> getCurrentUser() async {
    var officer = getUserFromToken(await getToken()); // return null for now
    return officer;
  }

  Future<String> getToken() async {
    final storage = FlutterSecureStorage();
    String token = await storage.read(key: "jwt_token").toString();
    
    return "'Bearer $token';";
  }

  Future<Officer> signInWithEmailAndPassword(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{'email': email, 'password': password},
      ),
    );

    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> dataMap = jsonDecode(response.body);

      print("dersual");
      // Officer rret = getUserFromToken(data['jwt']);
      officer_map = dataMap['data'];
      print("cheking if it's admin ${officer_map['is_admin']}");

      // storeing jwt value
      storeJwt(dataMap['jwt']);
      final sec = UserSecureStorage.setToken(token: dataMap['jwt']);
       token = await UserSecureStorage.getToken();

      // Officer result = Officer(
      //   id: officer_map['_id'] ?? "",
      //   is_admin: officer_map['is_admin'] ?? false,
      //   birthOfDate: officer_map["birthOfDate"],
      //   firstName: officer_map["firstName"],
      //   lastName: officer_map['lastName'],
      //   position: officer_map['position'],
      //   sex: officer_map['sex'],
      //   state: officer_map['state'],
      //   phoneNumber: officer_map['phoneNumber'],
      //   email: officer_map['email'],
      //   password: officer_map['password'],
      //   startDate: officer_map['startDate'],
      // );

      return getUserFromToken(dataMap['jwt']);
    } else {
      throw AuthenticationException(message: 'Wrong username or password');
    }
  }

  // Future<bool> signUpWithEmailAndPassword(
  //   bool is_admin,
  //   DateTime birthOfDate,
  //   String firstName,
  //   String lastName,
  //   String position,
  //   String sex,
  //   String state,
  //   String phoneNumber,
  //   String email,
  //   String password,
  //   DateTime startDate,
  // ) async {
  //   final response = await http.post(Uri.parse('$_baseUrl/auth/signup'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'isadmin': is_admin.toString(),
  //         'birthOfDate': birthOfDate.toString(),
  //         'firstName': firstName,
  //         'lastName': lastName,
  //         'position': position,
  //         'sex': sex,
  //         'state': state,
  //         'phoneNumber': phoneNumber,
  //         'email': email,
  //         'password': password,
  //         'startDate': startDate.toString(),
  //       }));
  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {eleteJwt();
  //     throw AuthenticationException(message: 'Wrong username or password');
  //   }
  // }

  Future<void> signOut() async {
    deleteJwt();
  }

  void storeJwt(token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'jwt_token', value: token);
    print(storage);
  }

  void deleteJwt() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(
      key: 'jwt_token',
    );
  }

  Officer getUserFromToken(String token) {
    print('test-1');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload['id']);
    print("token id is: ${payload['id']}");
    // To check if token is expired
    bool isExpired = Jwt.isExpired(token);

    // Can be used for auth state
    if (!isExpired) {
      //   Token isn't expired

      Officer result = Officer(
        id: officer_map['id'] ?? "",
        is_admin: officer_map['is_admin'] ?? false,
        birthOfDate: officer_map["birthOfDate"],
        firstName: officer_map["firstName"],
        lastName: officer_map['lastName'],
        position: officer_map['position'],
        sex: officer_map['sex'],
        state: officer_map['state'],
        phoneNumber: officer_map['phoneNumber'],
        email: officer_map['email'],
        password: officer_map['password'],
        startDate: officer_map['startDate'],
      );
      print('test-3');
      return result;
    } else {
      // error to be handled
      return Officer(
          id: "",
          is_admin: false,
          birthOfDate: "fakeBirthday",
          firstName: "firstName",
          lastName: "lastName",
          position: "position",
          sex: "sex",
          state: "state",
          phoneNumber: "phoneNumber",
          email: "email",
          password: "password",
          startDate: "1998");
    }
  }
}
