import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class OfficerState extends Equatable {
  const OfficerState();

  @override
  List<Object> get props => [];
}

class OfficerInitial extends OfficerState {}

class OfficerLoadingState extends OfficerState {}

class OfficerLoadedState extends OfficerState {
  final Officer officers;
  OfficerLoadedState({required this.officers});
}

class OfficerListLoadedState extends OfficerState {
  final List<Officer> officers;
  OfficerListLoadedState({required this.officers});
}

class OfficerErrorState extends OfficerState {
  final String message;
  OfficerErrorState({required this.message});
}
