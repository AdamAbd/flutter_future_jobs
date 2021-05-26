import 'package:flutter/cupertino.dart';

class WeightProvider with ChangeNotifier {
  double _weight = 40.0;

  double get weight => _weight;

  set weight(double newValue) {
    _weight = newValue;
    notifyListeners();
  }
}
