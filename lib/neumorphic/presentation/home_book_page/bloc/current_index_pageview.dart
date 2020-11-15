import 'package:flutter/cupertino.dart';

class CurrentIndexPageView with ChangeNotifier {
  int _currentindex = 1;
  int get currentidex => _currentindex;

  void handleCurrentIndexPageView(int newIndex) {
    _currentindex = newIndex;
    notifyListeners();
  }
}
