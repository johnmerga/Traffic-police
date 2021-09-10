import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class OfficerState extends Equatable {
  const OfficerState();

  @override
  List<Object> get props => [];
}

class OfficerLoading extends OfficerState {}

class OfficerOperationSuccess extends OfficerState {
  final Iterable<Officer> officers;

  OfficerOperationSuccess([this.officers = const []]);

  @override
  List<Object> get props => [officers];
}

class OfficerOperationFailure extends OfficerState {}
