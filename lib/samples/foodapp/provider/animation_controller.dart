import 'package:flutter/material.dart';

class HandleAnimation extends ChangeNotifier {
  AnimationController animationController;

  void initializateAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: Duration(
        milliseconds: 200,
      ),
    );
  }

  void disposeanimation() {
    animationController.dispose();
  }
}
