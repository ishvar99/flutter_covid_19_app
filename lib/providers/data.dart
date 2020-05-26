import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _infected = 0;
  int _recovered = 0;
  int _deaths = 0;
  int get infected => _infected;
  int get recovered => _recovered;
  int get deaths => _deaths;

  set infected(int val) {
    _infected = val;
    notifyListeners();
  }

  set recovered(int val) {
    _recovered = val;
    notifyListeners();
  }

  set deaths(int val) {
    _deaths = val;
    notifyListeners();
  }
}
