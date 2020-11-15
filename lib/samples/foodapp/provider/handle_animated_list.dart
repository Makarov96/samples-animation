import 'package:flutter/cupertino.dart';
import 'package:samples/samples/foodapp/model/food.dart';

class HandleAnimatedList extends ChangeNotifier {
  var _indexArrayListFood = 0;
  List<Food> _items = [];
  int get indexArrayListFood => _indexArrayListFood;
  List<Food> get items => _items;
  incrementArrayFood(List<Food> newlist) {
    _items..addAll(newlist);

    notifyListeners();
  }

  resetCounter() {
    _items = [];
    notifyListeners();
  }
}
