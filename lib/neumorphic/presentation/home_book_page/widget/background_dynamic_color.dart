import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../bloc/shared_book_color_bloc.dart';

class BackGroundDynamicColor extends StatelessWidget {
  const BackGroundDynamicColor({
    Key key,
    @required this.heightSize,
  })  : assert(heightSize != null),
        super(key: key);
  final double heightSize;

  @override
  Widget build(BuildContext context) {
    final screenwiHeight = MediaQuery.of(context).size.height;
    final sharedbookcolorbloc = Provider.of<SharedBookColorBloc>(context);
    return Container(
      height: screenwiHeight * heightSize,
      decoration: BoxDecoration(
        color: sharedbookcolorbloc.color,
      ),
    );
  }
}
