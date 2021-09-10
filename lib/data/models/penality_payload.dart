import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:traffic_police/data/models/models.dart';

class PenaltyPayload with ChangeNotifier {
  Penalty penalty = Penalty(
      id: '',
      officerId: '',
      subcity: '',
      victimName: '',
      victimLastName: '',
      license_number: '',
      plate_number: '',
      description: '',
      penalty_in_birr: 0,
      dateOfIssue: DateTime.now());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updatePenalty(Penalty _penalty) {
    penalty = _penalty;
    notifyListeners();
  }
}
