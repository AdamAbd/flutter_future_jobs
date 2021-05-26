import 'package:flutter/cupertino.dart';

class HeightProvider with ChangeNotifier {
  double _height = 100.0;

  double get height => _height;

  set height(double newValue) {
    _height = newValue;
    notifyListeners();
  }
}
