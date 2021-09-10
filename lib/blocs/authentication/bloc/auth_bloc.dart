import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:traffic_police/blocs/authentication/bloc/authentication.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
