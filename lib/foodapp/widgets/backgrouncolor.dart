import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgrounColor extends StatelessWidget {
  BackgrounColor({Key key, @required this.width});
  double width;

  @override
  Widget build(BuildContext context) {
    if (this.width == null) {
      width = 1.0;
    }
    return Container(
      width: MediaQuery.of(context).size.width * this.width,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(color: Color(0xFFEEF7FA)),
    );
  }
}
