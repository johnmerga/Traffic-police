import 'auth_temp.dart';
import 'package:equatable/equatable.dart';

abstract class AuthtempEvent extends Equatable {
  const AuthtempEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthtempEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthtempEvent {}