import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class PenaltyState extends Equatable {
  final List<Penalty> penalties;
  PenaltyState({this.penalties = const []});
  @override
  List<Object> get props => [];
}

class PenaltyInitial extends PenaltyState {}

class PenaltyOperationFailure extends PenaltyState {
  final String errMsg;
  PenaltyOperationFailure({required this.errMsg});
}

class PenaltyOperationSuccess extends PenaltyState {
  PenaltyOperationSuccess({required List<Penalty> penalties})
      : super(penalties: penalties);
}

class PenaltyLoading extends PenaltyState {}
