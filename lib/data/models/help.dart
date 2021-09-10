import 'package:equatable/equatable.dart';

class Help extends Equatable {
  final String id;
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
      // '_id': id,
      'officerId': officerId,
      'findAssistance': findAssistance.toString(),
      'subcity': subcity,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  Help copyWith({
    String? id,
    String? officerId,
    bool? findAssistance,
    String? subcity,
    String? description,
    DateTime? date,
  }) {
    return Help(
      id: id ?? this.id,
      officerId: officerId ?? this.officerId,
      findAssistance: findAssistance ?? this.findAssistance,
      subcity: subcity ?? this.subcity,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json['_id'],
      officerId: json['officerId'],
      findAssistance: json['findAssistance'],
      subcity: json['subcity'],
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }

  @override
  List<Object?> get props =>
      [id, officerId, findAssistance, subcity, description, date];
}
