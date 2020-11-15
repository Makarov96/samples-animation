import 'package:flutter/cupertino.dart';

class HandleCurrentIntem with ChangeNotifier {
  var _currentItem = 0;

  int get currentItem => _currentItem;

  updateCurrentItem(int currentValue) {
    _currentItem = currentValue;
    notifyListeners();
  }
}
