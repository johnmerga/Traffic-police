import 'package:equatable/equatable.dart';

class Penalty extends Equatable {
  final int id;
  final int officerId;
  final String subcity;
  final String victimName;
  final String victimLastName;
  final String license_number;
  final String plate_number;
  final String description;
  final int penalty_in_birr;
  final DateTime dateOfIssue;

  Penalty
({
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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'officerId': officerId,
      'subcity': 'subcity',
      'victimName': victimName,
      'victimLastName': victimLastName,
      'license_number': license_number,
      'plate_number': plate_number,
      'description': description,
      'penalty_in_birr': penalty_in_birr,
      'dateOfIssue': dateOfIssue,
    };
  }

  factory Penalty
.fromJson(Map<String, dynamic> json) {
    return Penalty 
  (
        id: json['_id'],
        officerId: json['officerId'],
        subcity: json['subcity'],
        victimName: json['victimName'],
        victimLastName: json['victimLastName'],
        license_number: json['license_number'],
        plate_number: json['plate_number'],
        description: json['description'],
        penalty_in_birr: json['penalty_in_birr'],
        dateOfIssue: json['dateOfIssue']);
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
