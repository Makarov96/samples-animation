import 'package:flutter/material.dart';
import 'package:samples/samples/spaceconcep/widgets/layout/layout_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutHome(),
    );
  }
}
