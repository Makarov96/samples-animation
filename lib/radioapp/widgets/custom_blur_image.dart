import 'package:flutter/material.dart';

class CustomBlurUpImage extends StatelessWidget {
  const CustomBlurUpImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -80,
      left: -180,
      bottom: -10,
      right: 60,
      child: Transform.rotate(
        angle: 280.0,
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                blurRadius: 50,
                spreadRadius: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
