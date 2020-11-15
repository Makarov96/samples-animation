import 'package:flutter/material.dart';

class FoodAppPagination extends StatefulWidget {
  const FoodAppPagination({Key key}) : super(key: key);

  @override
  _FoodAppPaginationState createState() => _FoodAppPaginationState();
}

class _FoodAppPaginationState extends State<FoodAppPagination>
    with TickerProviderStateMixin {
  AnimationController animationController;
  bool isTouched = false;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 400,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final screenwidth = MediaQuery.of(context).size.width;
    final screenwiHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: List.generate(
          17,
          (index) => AnimatedBuilder(
            animation: animationController.view,
            child: Container(
              height: screenwiHeight * 0.8,
              width: 500,
              child: Center(
                child: Text('hopla'),
              ),
              decoration: BoxDecoration(
                color: Colors.primaries[index],
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return GestureDetector(
                onTap: () {
                  animationController.forward();
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      animationController.value,
                      animationController.value * 255,
                    ),
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
