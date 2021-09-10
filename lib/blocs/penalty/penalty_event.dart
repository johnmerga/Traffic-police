import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

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

class FetchPenaltyByOfficer extends PenaltyEvent {
  FetchPenaltyByOfficer();
}

class UpdatePenalty extends PenaltyEvent {
  final Penalty penalty;
  UpdatePenalty({required this.penalty});
}
