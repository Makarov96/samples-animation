import 'package:flutter/material.dart';

import 'package:samples/samples/radioapp/widgets/background_image.dart';

class LogingPage extends StatelessWidget {
  const LogingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          BackhgroundImageTwo(
            path: 'assets/radioapp/backgroundimage.png',
          ),
          Transform(
            transform: Matrix4.identity()
              ..translate(screenWidth * 0.6, screenHeight * 0.3)
              ..rotateZ(5.54),
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Color(0xFFFF296D),
                  borderRadius: BorderRadius.circular(70.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 1, size.height * 0.6)
      ..lineTo(0, size.height / 1)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
