import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:traffic_police/data/models/models.dart';

class HelpPayload with ChangeNotifier {
  Help help = Help(
    id: '',
    officerId: '',
    subcity: '',
    date: DateTime.now(),
    description: '',
    findAssistance: false,
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateHelp(Help _help) {
    help = _help;
    notifyListeners();
  }
}
