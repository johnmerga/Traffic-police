import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/role.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();
}

class RoleLoad extends RoleEvent {
  @override
  List<Object> get props => [];
}

class RoleCreate extends RoleEvent {
  final Role role;
  const RoleCreate(this.role);

  @override
  List<Object> get props => [role];
}

class RoleDelete extends RoleEvent {
  final Role role;
  const RoleDelete(this.role);

  @override
  List<Object> get props => [role];
}
