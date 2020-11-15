import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:samples/samples/radioapp/widgets/background_image.dart';
import 'package:samples/samples/radioapp/widgets/bakcground_image_women.dart';
import 'package:samples/samples/radioapp/widgets/custom_blur_image.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWith = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          BackgroundImageWomen(),
          BackhgroundImage(
            path: 'assets/radioapp/blur.png',
          ),
          CustomBlurUpImage(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.08,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWith * 0.01,
                    ),
                    child: Image.asset(
                      'assets/radioapp/icon.png',
                      color: Colors.white,
                      height: screenHeight * 0.09,
                      width: screenWith * 0.09,
                    ),
                  ),
                  Text(
                    'ter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              width: screenWith * 0.6,
              height: screenHeight * 0.1,
            ),
          ),
          MiddleContentText(screenWith: screenWith, screenHeight: screenHeight),
          CustomRaiseButton(screenHeight: screenHeight, screenWith: screenWith),
        ],
      ),
    );
  }
}

class CustomRaiseButton extends StatelessWidget {
  const CustomRaiseButton({
    Key key,
    @required this.screenHeight,
    @required this.screenWith,
  }) : super(key: key);

  final double screenHeight;
  final double screenWith;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.05),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          splashColor: Colors.white.withOpacity(0.05),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => LogingPage()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: screenWith * 0.65,
            height: screenHeight * 0.065,
            child: Center(
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          color: Color(0xFFFF296D),
        ),
      ),
    );
  }
}

class MiddleContentText extends StatelessWidget {
  const MiddleContentText({
    Key key,
    @required this.screenWith,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenWith;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWith * 0.08,
      ),
      padding: EdgeInsets.only(top: screenHeight * 0.25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let\'s Get \nStarted',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 65,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.04),
            width: screenWith * 0.5,
            child: Text(
              'Enjoy the best radio stations, from your home, don\'t miss out on anything',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
