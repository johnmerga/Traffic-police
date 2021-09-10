import 'dart:convert';

import 'package:traffic_police/data/data_provider/user_secure_storage.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:http/http.dart' as http;

class PenaltyDataProvider {
  static final String _baseUrl = "http://10.0.2.2:5000/api/penalty";
  Future<String> getToken() async {
    var token = await UserSecureStorage.getToken();
    print('token getter: $token');
    return "Bearer $token";
  }

  // Future<Penalty> fetchByCode() async {
  //   final response = await http.get(Uri.parse(_baseUrl));

  //   if (response.statusCode == 200) {
  //     return Penalty.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetching Penalty by code failed");
  //   }
  // }
  Future<Penalty> create(Penalty penalty) async {
    try {
      var tk = await getToken();

      final http.Response response = await http.post(Uri.parse(_baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'authorization':
                '$tk'
          },
          body: json.encode(penalty.toMap()));
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return Penalty.fromJson(responseBody['data']);
      } else {
        throw Exception("Failed to create Penalty");
      }
    } catch (e) {
      throw Exception("Failed to create Penalty");
    }
  }

  Future<List<Penalty>> fetchOfficerPenalties() async {
    try {
      var tk = await getToken();

      final response = await http.get(Uri.parse(_baseUrl), headers: {
        'authorization':
            '$tk'
      });
      if (response.statusCode == 201) {
        Map<String, dynamic> penalties = jsonDecode(response.body);
        return penalties['data']
            .map<Penalty>((c) => Penalty.fromJson(c))
            .toList();
      } else {
        throw Exception("Could not fetch Penalties");
      }
    } catch (e) {
      throw Exception("Could not fetch Penalties");
    }
  }

  Future<void> update(Penalty penalty) async {
    try {
      var tk = await getToken();

      final response = await http.put(
        Uri.parse(
          "$_baseUrl/${penalty.id}",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization':
              '$tk'
        },
        body: json.encode(penalty.toMap()),
      );

      if (response.statusCode != 201) {
        throw Exception("Could not update the Penalty");
      }
    } catch (e) {
      throw Exception("Could not update the Penalty");
    }
  }

  Future<void> delete(String id) async {
    try {
      var tk = await getToken();

      final response =
          await http.delete(Uri.parse("$_baseUrl/${id}"), headers: {
        'authorization':
            '$tk'
      });
      if (response.statusCode != 201) {
        throw Exception("Field to delete the Penalty");
      }
    } catch (e) {
      throw Exception("Field to delete the Penalty");
    }
  }
}
