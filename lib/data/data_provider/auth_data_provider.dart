import 'dart:convert';
import 'package:traffic_police/data/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:traffic_police/exceptions/exception.dart';

class AuthenticationDataProvider {
  final _baseUrl = "http://192.168.122.1:5000/api";

  var token;

  Future<Officer> getCurrentUser() async {
    var officer = getUserFromToken(await getToken()); // return null for now
    return officer;
  }

  Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "jwt_token").toString();
    return "'Bearer $token';";
  }

  Future<Officer> signInWithEmailAndPassword(
      String email, String password) async {
    final response = await http.post(Uri.parse('$_baseUrl/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      storeJwt(data['token']);

      return getUserFromToken(data['token']);
    } else {
      throw AuthenticationException(message: 'Wrong username or password');
    }
  }

  Future<bool> signUpWithEmailAndPassword(
    bool is_admin,
    DateTime birthOfDate,
    String firstName,
    String lastName,
    String position,
    String sex,
    String state,
    String phoneNumber,
    String email,
    String password,
    DateTime startDate,
  ) async {
    final response = await http.post(Uri.parse('$_baseUrl/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'isadmin': is_admin.toString(),
          'birthOfDate': birthOfDate.toString(),
          'firstName': firstName,
          'lastName': lastName,
          'position': position,
          'sex': sex,
          'state': state,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
          'startDate': startDate.toString(),
        }));
    if (response.statusCode == 201) {
      return true;
    } else {
      throw AuthenticationException(message: 'Wrong username or password');
    }
  }

  Future<void> signOut() async {
    deleteJwt();
  }

  void storeJwt(token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'jwt_token', value: token);
  }

  void deleteJwt() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(
      key: 'jwt_token',
    );
  }

  Officer getUserFromToken(String token) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);

    // To check if token is expired
    bool isExpired = Jwt.isExpired(token);
    // Can be used for auth state
    if (!isExpired) {
      //   Token isn't expired

      Officer result = Officer(
          id: payload['_id'],
          is_admin: payload['is_admin'],
          birthOfDate: payload["birthOfDate"],
          firstName: payload["firstName"],
          lastName: payload['lastName'],
          position: payload['position'],
          sex: payload['sex'],
          state: payload['state'],
          phoneNumber: payload['phoneNumber'],
          email: payload['email'],
          password: payload['password'],
          startDate: payload['startDate']);
      return result;
    } else {
      // error should be handled
      return Officer(
          id: "",
          is_admin: false,
          birthOfDate: "",
          firstName: "firstName",
          lastName: "lastName",
          position: "position",
          sex: "sex",
          state: "state",
          phoneNumber: "phoneNumber",
          email: "email",
          password: "password",
          startDate: DateTime(1998));
    }
  }
}

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// // Create storage
// final storage = new FlutterSecureStorage();

// // Read value
// String value = await storage.read(key: key);

// // Read all values
// Map<String, String> allValues = await storage.readAll();

// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();

// // Write value
// await storage.write(key: key, value: value);

// Future<String> getToken() async {
//   final storage = new FlutterSecureStorage();

// // // Read value
//   String value = await storage.read(key: "jwt_token");

// // Create storage
// final storage = new FlutterSecureStorage();

// // Write value
// await storage.write(key: 'jwt', value: token);
//   String token = "";
//   return "'Bearer $token';";
// }

// Future<Dio> networkInterCeptor() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// String token = prefs.getString('token');

// String refreshToken = prefs.getString('refreshToken');
