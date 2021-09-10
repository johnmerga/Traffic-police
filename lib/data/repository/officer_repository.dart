
import 'package:traffic_police/data/models/models.dart';

class OfficerRepository {
  final OfficerRepository dataProvider;
  OfficerRepository(this.dataProvider);

  Future<Officer> create(Officer officer) async {
    return this.dataProvider.create(officer);
  }

  Future<Officer> update(String id, Officer officer) async {
    return this.dataProvider.update(id, officer);
  }

  Future<List<Officer>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
