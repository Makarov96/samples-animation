import 'package:flutter/cupertino.dart';

class HandleStateFavoriteButton extends ChangeNotifier {
  var _isfavorite = false;
  bool get isfavorite => _isfavorite;

  void iLikedFood(bool favorite) {
    _isfavorite = favorite;
    notifyListeners();
  }
}
