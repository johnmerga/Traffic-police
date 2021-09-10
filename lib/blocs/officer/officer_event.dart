import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class OfficerEvent extends Equatable {
  const OfficerEvent();

  @override
  List<Object> get props => [];
}

class GetOfficersEvent extends OfficerEvent {
  final List<Officer> officers;
  GetOfficersEvent({required this.officers});
}

class UpdateOfficerEvent extends OfficerEvent {
  final Officer officer;
  UpdateOfficerEvent({required this.officer});
}
