import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  String _text = "begin";
  int get counter => _counter;

  void inCreaseCounter() {
    _counter++;

    notifyListeners();
  }

  void cangeText() {
    _text = "done";
    notifyListeners();
  }
}
