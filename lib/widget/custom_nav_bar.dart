import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:samples/spaceconcep/const/colors.dart';
import 'package:samples/spaceconcep/const/const.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _sigmaX = 0.0; // from 0-10
    double _sigmaY = 0.0; // from 0-10
    // double _opacity = 0.1; // from 0-1.0
    final screenHeight = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
      child: Container(
        height: screenHeight * 0.08,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(
                FromAssets.brujula,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                FromAssets.planet,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                FromAssets.profile,
              ),
              onPressed: () {},
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: CustomColors.customcolornavbar.withOpacity(0.5),
        ),
      ),
    );
  }
}
