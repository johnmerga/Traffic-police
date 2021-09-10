import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:traffic_police/blocs/officer/officer.dart';

class OfficerBloc extends Bloc<OfficerEvent, OfficerState> {
  OfficerBloc() : super(OfficerInitial());

  @override
  Stream<OfficerState> mapEventToState(
    OfficerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
