import 'package:equatable/equatable.dart';

class Help extends Equatable {
  final int id;
  final String officerId;
  final bool findAssistance;
  final String subcity;
  final String description;
  final DateTime date;
  Help({
    required this.id,
    required this.officerId,
    required this.findAssistance,
    required this.subcity,
    required this.description,
    required this.date,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'officerId': officerId,
      'findAssistance': findAssistance,
      'subcity': subcity,
      'description': description,
      'date': date,
    };
  }

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json['id'],
      officerId: json['officerId'],
      findAssistance: json['findAssistance'],
      subcity: json['subcity'],
      description: json['description'],
      date: json['date'],
    );
  }

  @override
  List<Object?> get props =>
      [id, officerId, findAssistance, subcity, description, date];
}
