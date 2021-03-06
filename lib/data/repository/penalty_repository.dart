import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/data/data_provider/penalty_data_provider.dart';

class PenaltyRepository {
  final PenaltyDataProvider dataProvider;
  PenaltyRepository(this.dataProvider);
  // final List<Penalty> mockPenalties = List.generate(
  //     100,
  //     (index) => Penalty(
  //         id: index,
  //         officerId: index + 100,
  //         subcity: "subsity $index",
  //         victimName: "Victim $index",
  //         victimLastName: "Last $index",
  //         license_number: "License $index",
  //         plate_number: "plate_number $index",
  //         description: "description $index",
  //         penalty_in_birr: index * 50,
  //         dateOfIssue: DateTime.now()));

  Future<Penalty> create(Penalty penalty) async {
    return await dataProvider.create(penalty);
  }

  Future<void> update(Penalty penalty) async {
    return await dataProvider.update(penalty);
  }

  Future<List<Penalty>> fetchOfficerPenalties() async {
    // return mockPenalties;
    // return this.dataProvider.fetchAll(id);
    return await dataProvider.fetchOfficerPenalties();
  }

  Future<void> delete(String id) async {
    // mockPenalties.removeWhere((element) => element.id == id);
    // this.dataProvider.delete(id);
    return await dataProvider.delete(id);
  }
}
