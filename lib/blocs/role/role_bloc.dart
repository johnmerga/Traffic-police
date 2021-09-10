import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/role/role.dart';
import 'package:traffic_police/data/repository/role_repository.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final RoleRepository roleRepository;

  RoleBloc({required this.roleRepository})
      : assert(roleRepository != null),
        super(RoleLoading());

  @override
  Stream<RoleState> mapEventToState(RoleEvent event) async* {
    if (event is RoleLoad) {
      yield RoleLoading();
      try {
        final roles = await roleRepository.getRoles();
        yield RoleLoadSuccess(roles);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }

    if (event is RoleCreate) {
      try {
        await roleRepository.createRole(event.role);
        final roles = await roleRepository.getRoles();
        yield RoleLoadSuccess(roles);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }

    if (event is RoleDelete) {
      try {
        await roleRepository.deleteRole(event.role.id);
        final roles = await roleRepository.getRoles();
        yield RoleLoadSuccess(roles);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }
  }
}
