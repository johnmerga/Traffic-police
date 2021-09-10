part of 'penalty_bloc.dart';

abstract class PenaltyEvent extends Equatable {
  const PenaltyEvent();

  @override
  List<Object> get props => [];
}

class CreatePenalty extends PenaltyEvent {
  final Penalty penalty;
  CreatePenalty({required this.penalty});
}

class DeletePenalty extends PenaltyEvent {
  final Penalty penalty;
  DeletePenalty({required this.penalty});
}

class FetchPenalty extends PenaltyEvent {
  final int id;
  FetchPenalty({required this.id});
}

class FetchPenaltyByOfficer extends PenaltyEvent {
  final int officerId;
  FetchPenaltyByOfficer({required this.officerId});
}

class UpdatePenalty extends PenaltyEvent {
  final Penalty penalty;
  UpdatePenalty({required this.penalty});
}
