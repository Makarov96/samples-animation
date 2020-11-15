import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../bloc/audiobook_bloc/audiobook_bloc.dart';
import '../bloc/shared_book_color_bloc.dart';

import '../../../widgets/custom_nav_bar.dart';
import '../bloc/current_index_bloc.dart';
import '../bloc/current_index_pageview.dart';
import '../widget/background_dynamic_color.dart';
import '../widget/custom_pageview.dart';

class HomeBookPage extends StatelessWidget {
  const HomeBookPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudiobookBloc(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CurrentIndexBloc(),
          ),
          ChangeNotifierProvider(
            create: (_) => CurrentIndexPageView(),
          ),
          ChangeNotifierProvider(
            create: (_) => SharedBookColorBloc(),
          )
        ],
        child: Scaffold(
            body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CustomHeader(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BackGroundDynamicColor(
                heightSize: 0.5,
              ),
            ),
            CustomPageView(),
            CustomNavBar(),
          ],
        )),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Listening Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 50,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
