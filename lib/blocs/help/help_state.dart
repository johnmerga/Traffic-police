import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class HelpState extends Equatable {
  HelpState();
  @override
  List<Object> get props => [];
}

class HelpInitial extends HelpState {}

class HelpLoadingState extends HelpState {}

class HelpLoadedState extends HelpState {
  final Help help;
  HelpLoadedState({required this.help});
}

class HelpListLoadedState extends HelpState {
  final List<Help> helps;
  HelpListLoadedState({required this.helps});
}

class HelpErrorState extends HelpState {
  final String message;
  HelpErrorState({required this.message});
}
