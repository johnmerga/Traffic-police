import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/role.dart';

class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object> get props => [];
}

class RoleLoading extends RoleState {}

class RoleLoadSuccess extends RoleState {
  final List<Role> roles;

  RoleLoadSuccess([this.roles = const []]);

  @override
  List<Object> get props => [roles];
}

class RoleOperationFailure extends RoleState {}
