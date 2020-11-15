import 'package:flutter/cupertino.dart';

class CurrentItemProvider extends ChangeNotifier {
  var _currentItem = 0;

  int get currentItem => _currentItem;

  void updateCurrenItem(int index) {
    _currentItem = index;
    notifyListeners();
  }
}
