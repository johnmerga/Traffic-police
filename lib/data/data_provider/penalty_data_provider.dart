import 'dart:convert';

import 'package:traffic_police/data/models/models.dart';
import 'package:http/http.dart' as http;

class PenaltyDataProvider {
  static final String _baseUrl = "http://192.168.122.1:5000/api/penalty";

  Future<Penalty> create(Penalty penalty) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          '_id': penalty.id,
          'officerId': penalty.officerId,
          'subcity': penalty.subcity,
          'victimName': penalty.victimName,
          'victimLastName': penalty.victimLastName,
          'license_number': penalty.license_number,
          'plate_number': penalty.plate_number,
          'description': penalty.description,
          'penalty_in_birr': penalty.penalty_in_birr,
          'dateOfIssue': penalty.dateOfIssue,
        }));

    if (response.statusCode == 201) {
      return Penalty.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create Penalty");
    }
  }

  Future<Penalty> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return Penalty.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Penalty by code failed");
    }
  }

  Future<List<Penalty>> fetchAll(String id) async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final Penaltys = jsonDecode(response.body) as List;
      return Penaltys.map((c) => Penalty.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch Penalties");
    }
  }

  Future<Penalty> update(Penalty penalty) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/${penalty.id}"),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(
        {
          'id': penalty.id,
          'officerId': penalty.officerId,
          'subcity': penalty.subcity,
          'victimName': penalty.victimName,
          'victimLastName': penalty.victimLastName,
          'license_number': penalty.license_number,
          'plate_number': penalty.plate_number,
          'description': penalty.description,
          'penalty_in_birr': penalty.penalty_in_birr,
          'dateOfIssue': penalty.dateOfIssue,
        },
      ),
    );

    if (response.statusCode == 200) {
      return Penalty.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the Penalty");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/${id}"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the Penalty");
    }
  }
}
