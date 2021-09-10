import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';

abstract class AuthenticationEvent extends Equatable {
  // const AuthenticationEvent();
  AuthenticationEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

// Fired just after the app is loaded
class AppLoaded extends AuthenticationEvent {}

// Fired just a user has successfully logged in
class UserLoggedIn extends AuthenticationEvent {
  final Officer user;

  UserLoggedIn({required this.user}) : super([user]);
  @override
  List<Object> get props => [user];
}

// Fired just after the user has logged out
class UserLoggedOut extends AuthenticationEvent {}
