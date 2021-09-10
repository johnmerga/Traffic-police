import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:traffic_police/blocs/help/help.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc() : super(HelpInitial());

  @override
  Stream<HelpState> mapEventToState(
    HelpEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
