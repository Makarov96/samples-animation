import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/foodapp/provider/animation_controller.dart';
import 'package:samples/foodapp/widgets/backgrouncolor.dart';
import 'package:samples/foodapp/widgets/chineese_food_list.dart';
import 'package:samples/foodapp/widgets/food_details.dart';
import 'package:samples/foodapp/widgets/header.dart';

import 'detailscreen.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({Key key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    final handleanimationprovider =
        Provider.of<HandleAnimation>(context, listen: false);
    handleanimationprovider.initializateAnimation(this);
    handleanimationprovider.animationController
        .addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(),
          ),
        );
        handleanimationprovider.animationController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    final handleanimationprovider =
        Provider.of<HandleAnimation>(context, listen: false);
    handleanimationprovider.disposeanimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final handleanimationprovider =
        Provider.of<HandleAnimation>(context, listen: false);
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          BackgrounColor(width: 0.5),
          AnimatedBuilder(
            animation: handleanimationprovider.animationController.view,
            child: ChineeseFoodList(),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                    handleanimationprovider.animationController.value,
                    handleanimationprovider.animationController.value * 100,
                  ),
                child: AnimatedOpacity(
                  duration:
                      handleanimationprovider.animationController.duration,
                  opacity:
                      handleanimationprovider.animationController.isAnimating
                          ? 0.0
                          : 1.0,
                  child: child,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: handleanimationprovider.animationController.view,
            child: FoodDetails(),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                      handleanimationprovider.animationController.value * 400),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: handleanimationprovider.animationController.view,
            child: Hero(
              tag: '20',
              transitionOnUserGestures: true,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.80,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 30,
                      left: 25.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Vallet Farm",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 30.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Eggs",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 30,
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/foodapp/food3.png"))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(top: 15, left: 0),
                                    alignment: Alignment.center,
                                    child: Text("Fruit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500))),
                                Container(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    alignment: Alignment.center,
                                    child: Text("Lime therbet",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10))),
                                Container(
                                    padding: EdgeInsets.only(top: 5, left: 10),
                                    alignment: Alignment.center,
                                    child: Text("finger tome caviar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)))
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFD1D1D6).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          handleanimationprovider.animationController
                            ..forward();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20.0,
                          ),
                          width: 130,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://image.freepik.com/foto-gratis/superficie-pared-marmol-patron-azul-grietas_23-2148327727.jpg"))),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                      handleanimationprovider.animationController.value,
                      handleanimationprovider.animationController.value *
                          -90.0),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal:
                        handleanimationprovider.animationController.value * 40,
                  ),
                  child: child,
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Hero(
              tag: 'holaomo',
              child: Container(
                width: 210,
                height: 210,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/foodapp/food2.png"),
                  ),
                ),
              ),
            ),
          ),
          Header(),
        ],
      ),
    );
  }
}
