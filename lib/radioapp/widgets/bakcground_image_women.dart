import 'package:flutter/material.dart';

class BackgroundImageWomen extends StatelessWidget {
  const BackgroundImageWomen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/radioapp/women.png'),
        ),
      ),
    );
  }
}
