import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var countA = 0;
  var countB = 0;
  var countC = 0;

  void incrementCounterA() {
    countA++;
    notifyListeners();
  }

  void incrementCounterB() {
    countB++;
    notifyListeners();
  }

  void incrementCounterC() {
    countC++;
    notifyListeners();
  }
}