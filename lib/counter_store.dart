import 'package:flutter/material.dart';

class Counter {
  int valeur;
  Counter(this.valeur);
}

class CounterStore extends InheritedWidget {
  final ValueNotifier<Counter> counter;
  const CounterStore({super.key, required super.child, required this.counter});

  void incrementCounter() {
    counter.value = Counter(counter.value.valeur + 1);
  }

  void decrementerValeur() {
    counter.value = Counter(counter.value.valeur - 1);
  }

  static CounterStore of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterStore>()
        as CounterStore;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
