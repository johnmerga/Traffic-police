import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class AuthtempState extends Equatable {
  const AuthtempState();

  @override
  List<Object> get props => [];
}

class AuthtempInitial extends AuthtempState {}

class LoggedIn extends AuthtempState {
  final Officer user;
  LoggedIn({required this.user});
}

class LoginFailed extends AuthtempState {
  final String error;
  LoginFailed({required this.error});
}

class AuthLoading extends AuthtempState {}
