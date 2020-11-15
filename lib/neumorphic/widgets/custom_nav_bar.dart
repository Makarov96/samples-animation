import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:samples/neumorphic/presentation/home_book_page/bloc/current_index_bloc.dart';
import 'package:samples/neumorphic/presentation/home_book_page/bloc/shared_book_color_bloc.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndexProvider = Provider.of<CurrentIndexBloc>(
      context,
    );
    final sharedbookcolorbloc = Provider.of<SharedBookColorBloc>(context);
    List<Widget> children = [
      MaterialButton(
        height: 30,
        minWidth: 130,
        color: currentIndexProvider.currentindex == 0
            ? Colors.white
            : Colors.transparent,
        elevation: 0.0,
        child: Center(
          child: Image.asset(
            'assets/neumorphic/librery.png',
            height: 30,
            width: 30,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () => currentIndexProvider.handleindex(0),
      ),
      MaterialButton(
        elevation: 0.0,
        height: 30,
        minWidth: 130,
        color: currentIndexProvider.currentindex == 1
            ? Colors.white
            : Colors.transparent,
        child: Center(
          child: Image.asset(
            'assets/neumorphic/planet.png',
            height: 30,
            width: 30,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () => currentIndexProvider.handleindex(1),
      ),
      MaterialButton(
        elevation: 0.0,
        height: 30,
        minWidth: 130,
        color: currentIndexProvider.currentindex == 2
            ? Colors.white
            : Colors.transparent,
        child: Center(
          child: Image.asset(
            'assets/neumorphic/user.png',
            height: 30,
            width: 30,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () => currentIndexProvider.handleindex(2),
      ),
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 90,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          bottom: 20,
        ),
        child: Neumorphic(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
          style: NeumorphicStyle(
            color: sharedbookcolorbloc.color,
            depth: -11,
            intensity: 1.0,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
