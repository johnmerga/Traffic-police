import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/data/data_provider/help_data_provider.dart';

class HelpRepository {
  final HelpDataProvider dataProvider;
  HelpRepository(this.dataProvider);

  Future<Help> create(Help help) async {
    return await dataProvider.create(help);
  }

  Future<void> update(Help help) async {
    return await dataProvider.update(help);
  }

  Future<void> updateStatus(Help help) async {
    return await dataProvider.updateStatus(help);
  }

  Future<List<Help>> fetchAllHelps() async {
    return await dataProvider.fetchHelps();
  }

  Future<List<Help>> fetchHelpByOfficer() async {
    return await dataProvider.fetchHelpByOfficer();
  }

  Future<List<Help>> fetchAcceptedHelps() async {
    return await dataProvider.fetchAcceptedHelps();
  }

  Future<void> delete(String id) async {
    return await dataProvider.delete(id);
  }
}
