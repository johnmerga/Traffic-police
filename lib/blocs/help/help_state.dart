

import 'package:equatable/equatable.dart';

abstract class HelpState extends Equatable {
  const HelpState();
  
  @override
  List<Object> get props => [];
}

class HelpInitial extends HelpState {}
