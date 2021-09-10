import 'dart:convert';

import 'package:traffic_police/data/data_provider/user_secure_storage.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:http/http.dart' as http;

class HelpDataProvider {
  static final String _baseUrl = "http://192.168.122.1:5000/api/help";

  Future<String> getToken() async {
    var token = await UserSecureStorage.getToken();
    print('token getter: $token');
    return "Bearer $token";
  }

  // Future<Help> fetchByCode() async {
  //   final response = await http.get(Uri.parse(_baseUrl));

  //   if (response.statusCode == 200) {
  //     return Help.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetching Help by code failed");
  //   }
  // }
  Future<Help> create(Help help) async {
    try {
      var tk = await getToken();
      final http.Response response = await http.post(Uri.parse(_baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'authorization': '$tk'
          },
          body: json.encode(help.toMap()));
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return Help.fromJson(responseBody['data']);
      } else {
        throw Exception("Failed to create Help");
      }
    } catch (e) {
      throw Exception("Failed to create Help");
    }
  }

  Future<List<Help>> fetchHelps() async {
    try {
      var tk = await getToken();
      final response = await http
          .get(Uri.parse('$_baseUrl'), headers: {'authorization': '$tk'});
      if (response.statusCode == 201) {
        Map<String, dynamic> helps = jsonDecode(response.body);
        return helps['data'].map<Help>((c) => Help.fromJson(c)).toList();
      } else {
        throw Exception("Could not fetch Helps");
      }
    } catch (e) {
      throw Exception("Could not fetch Helps");
    }
  }

  Future<List<Help>> fetchHelpByOfficer() async {
    try {
      var tk = await getToken();
      final response = await http
          .get(Uri.parse('$_baseUrl/mine'), headers: {'authorization': '$tk'});
      if (response.statusCode == 201) {
        Map<String, dynamic> helps = jsonDecode(response.body);
        return helps['data'].map<Help>((c) => Help.fromJson(c)).toList();
      } else {
        throw Exception("Could not fetch Helps");
      }
    } catch (e) {
      throw Exception("Could not fetch Helps");
    }
  }

  Future<List<Help>> fetchAcceptedHelps() async {
    try {
      var tk = await getToken();
      final response = await http.get(Uri.parse('$_baseUrl/mine/accepted'),
          headers: {'authorization': '$tk'});
      if (response.statusCode == 201) {
        Map<String, dynamic> helps = jsonDecode(response.body);
        return helps['data'].map<Help>((c) => Help.fromJson(c)).toList();
      } else {
        throw Exception("Could not fetch Helps");
      }
    } catch (e) {
      throw Exception("Could not fetch Helps");
    }
  }

  Future<void> update(Help help) async {
    try {
      var tk = await getToken();
      final response = await http.put(
        Uri.parse(
          "$_baseUrl/${help.id}",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': '$tk'
        },
        body: json.encode(help.toMap()),
      );

      if (response.statusCode != 201) {
        throw Exception("Could not update the Help");
      }
    } catch (e) {
      throw Exception("Could not update the Help");
    }
  }

  Future<void> updateStatus(Help help) async {
    try {
      var tk = await getToken();
      final response = await http.put(
        Uri.parse(
          "$_baseUrl/updateStatus/${help.id}",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': '$tk'
        },
        body: json.encode(help.toMap()),
      );

      if (response.statusCode != 201) {
        throw Exception("Could not update the Help");
      }
    } catch (e) {
      throw Exception("Could not update the Help");
    }
  }

  Future<void> delete(String id) async {
    try {
      var tk = await getToken();
      final response = await http.delete(Uri.parse("$_baseUrl/${id}"),
          headers: {'authorization': '$tk'});
      if (response.statusCode != 201) {
        throw Exception("Field to delete the Help");
      }
    } catch (e) {
      throw Exception("Field to delete the Help");
    }
  }
}
