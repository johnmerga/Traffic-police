import 'package:flutter/cupertino.dart';
import 'package:traffic_police/data/data_provider/role_data.dart';
import 'package:traffic_police/data/models/role.dart';

class RoleRepository {
  final RoleDataProvider dataProvider;

  RoleRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<Role> createRole(Role role) async {
    return await dataProvider.createRole(role);
  }

  Future<List<Role>> getRoles() async {
    return await dataProvider.getRoles();
  }

  Future<void> deleteRole(String id) async {
    await dataProvider.deleteRole(id);
  }
}
