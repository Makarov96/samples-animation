import 'package:flutter/material.dart';

class CurrentIndexBloc with ChangeNotifier {
  int _currentIndex = 0;

  int get currentindex => _currentIndex;

  void handleindex(int newIndex) {
    _currentIndex = newIndex;

    notifyListeners();
  }
}
