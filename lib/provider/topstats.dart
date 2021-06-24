import 'package:flutter/foundation.dart';

class ChangeTopStats extends ChangeNotifier {
  String _type = 'goal';
  String get type => _type;
  void changeType(select) {
    _type = select;
    notifyListeners();
  }
}
