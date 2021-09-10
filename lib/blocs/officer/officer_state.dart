import 'package:equatable/equatable.dart';

abstract class OfficerState extends Equatable {
  const OfficerState();

  @override
  List<Object> get props => [];
}

class OfficerInitial extends OfficerState {}
