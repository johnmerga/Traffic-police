import 'package:equatable/equatable.dart';

class Penalty extends Equatable {
  final String id;
  final String officerId;
  final String subcity;
  final String victimName;
  final String victimLastName;
  final String license_number;
  final String plate_number;
  final String description;
  final int penalty_in_birr;
  final DateTime dateOfIssue;

  Penalty({
    required this.id,
    required this.officerId,
    required this.subcity,
    required this.victimName,
    required this.victimLastName,
    required this.license_number,
    required this.plate_number,
    required this.description,
    required this.penalty_in_birr,
    required this.dateOfIssue,
  });
  Penalty copyWith({
    String? id,
    String? officerId,
    String? subcity,
    String? victimName,
    String? victimLastName,
    String? license_number,
    String? plate_number,
    String? description,
    int? penalty_in_birr,
    DateTime? dateOfIssue,
  }) {
    return Penalty(
      id: id ?? this.id,
      officerId: officerId ?? this.officerId,
      subcity: subcity ?? this.subcity,
      victimName: victimName ?? this.victimName,
      victimLastName: victimLastName ?? this.victimLastName,
      license_number: license_number ?? this.license_number,
      plate_number: plate_number ?? this.plate_number,
      description: description ?? this.description,
      penalty_in_birr: penalty_in_birr ?? this.penalty_in_birr,
      dateOfIssue: dateOfIssue ?? this.dateOfIssue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // '_id': id,
      'officerId': officerId,
      'subcity': subcity,
      'victimName': victimName,
      'victimLastName': victimLastName,
      'license_number': license_number,
      'plate_number': plate_number,
      'description': description,
      'penalty_in_birr': penalty_in_birr.toString(),
      'dateOfIssue': dateOfIssue.toIso8601String(),
    };
  }

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
        id: json['_id'],
        officerId: json['officerId'],
        subcity: json['subcity'],
        victimName: json['victimName'],
        victimLastName: json['victimLastName'],
        license_number: json['license_number'],
        plate_number: json['plate_number'],
        description: json['description'],
        penalty_in_birr: json['penalty_in_birr'],
        dateOfIssue: DateTime.parse(json['dateOfIssue']));
  }

  @override
  List<Object?> get props => [
        id,
        officerId,
        subcity,
        victimName,
        victimLastName,
        license_number,
        plate_number,
        description,
        penalty_in_birr,
        dateOfIssue,
      ];
}
