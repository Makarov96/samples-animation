import 'package:flutter/material.dart';

class ImplicitAnimationPAge extends StatelessWidget {
  const ImplicitAnimationPAge({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImplicitAnimation(),
    );
  }
}

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key key}) : super(key: key);

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GestureDetector(
        onTap: () {
          print('fsd');
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: Container(
          height: 300,
          width: 300,
          color: Colors.red,
        ),
      ),
      builder: (context, child) {
        var horizontal = MediaQuery.of(context).size.width;
        var vertical = MediaQuery.of(context).size.height;
        print(animationController.value);
        return Transform(
          transform: Matrix4.identity()
            ..translate(
              animationController.value * (horizontal / 2),
              animationController.value * (vertical / 2),
            ),
          //..rotate(animationController., pi /2),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
