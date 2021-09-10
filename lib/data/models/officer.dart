import 'package:equatable/equatable.dart';
import 'dart:convert';

class Officer extends Equatable {
  List<Object> get props => [
        id,
        is_admin,
        birthOfDate,
        firstName,
        lastName,
        position,
        sex,
        state,
        phoneNumber,
        email,
        password,
        startDate,
      ];

  final String id;
  final bool is_admin;
  final String birthOfDate;
  final String firstName;
  final String lastName;
  final String position;
  final String sex;
  final String state;
  final String phoneNumber;
  final String email;
  final String password;
  final String startDate;

  Officer({
    required this.id,
    required this.is_admin,
    required this.birthOfDate,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.sex,
    required this.state,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.startDate,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'isadmin': is_admin,
      'birthOfDate': birthOfDate,
      'firstName': firstName,
      'lastName': lastName,
      'position': position,
      'sex': sex,
      'state': state,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'startDate': startDate,
    };
  }

  static Officer fromJson(Map<String, dynamic> json) {
    return Officer(
        id: json['_id'],
        is_admin: json['isadmin'],
        birthOfDate: json['birthOfDate'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        position: json['position'],
        sex: json['sex'],
        state: json['state'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        password: json['password'],
        startDate: json['startDate']);
  }

  String toJason() => json.encode(toMap());
}
