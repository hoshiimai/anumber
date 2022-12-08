import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CountProvider with ChangeNotifier {
  int counter = 0;
  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}