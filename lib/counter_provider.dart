import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  late int counter;
  CounterProvider(this.counter);

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}
