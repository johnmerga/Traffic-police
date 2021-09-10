import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'officer_event.dart';
part 'officer_state.dart';

class OfficerBloc extends Bloc<OfficerEvent, OfficerState> {
  OfficerBloc() : super(OfficerInitial());

  @override
  Stream<OfficerState> mapEventToState(
    OfficerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
