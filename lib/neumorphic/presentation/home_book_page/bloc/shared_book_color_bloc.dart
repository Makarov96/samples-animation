import 'package:flutter/material.dart';

class SharedBookColorBloc with ChangeNotifier {
  Color _color = Color(0xFFFFC24E);
  Color get color => _color;

  void changeColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}
