import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class HelpEvent extends Equatable {
  const HelpEvent();

  @override
  List<Object> get props => [];
}

class CreateHelp extends HelpEvent {
  final Help help;
  CreateHelp({required this.help});
}

class DeleteHelp extends HelpEvent {
  final Help help;
  DeleteHelp({required this.help});
}

class FetchHelpByOfficer extends HelpEvent {
  FetchHelpByOfficer();
}

class FetchHelp extends HelpEvent {
  FetchHelp();
}

class FetchAcceptedHelp extends HelpEvent {
  FetchAcceptedHelp();
}

class UpdateHelp extends HelpEvent {
  final Help help;
  UpdateHelp({required this.help});
}

class UpdateHelpStatus extends HelpEvent {
  final Help help;
  UpdateHelpStatus({required this.help});
}
