import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class OfficerEvent extends Equatable {
  const OfficerEvent();
}

class OfficerLoad extends OfficerEvent {
  const OfficerLoad();

  @override
  List<Object> get props => [];
}

class OfficerCreate extends OfficerEvent {
  final Officer officer;

  const OfficerCreate(this.officer);
  @override
  List<Object> get props => [officer];

  @override
  String toString() => 'Officer Created {Officer: $officer}';
}

class OfficerUpdate extends OfficerEvent {
  final Officer officer;

  const OfficerUpdate(this.officer);

  @override
  List<Object> get props => [officer];

  @override
  String toString() => 'Officer Updated {Officer: $officer}';
}

class OfficerDelete extends OfficerEvent {
  final String id;

  const OfficerDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Officer Deleted {Officer Id: $id}';
}
