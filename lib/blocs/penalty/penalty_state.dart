import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class PenaltyState extends Equatable {
  PenaltyState();
  @override
  List<Object> get props => [];
}

class PenaltyInitial extends PenaltyState {}

class PenaltyLoadingState extends PenaltyState {}

class PenaltyLoadedState extends PenaltyState {
  final Penalty panlity;
  PenaltyLoadedState({required this.panlity});
}

class PenaltyListLoadedState extends PenaltyState {
  final List<Penalty> panalties;
  PenaltyListLoadedState({required this.panalties});
}

class PenaltyErrorState extends PenaltyState {
  final String message;
  PenaltyErrorState({required this.message});
}
