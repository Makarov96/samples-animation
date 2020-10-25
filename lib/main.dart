import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/foodapp/provider/animation_controller.dart';
import 'package:samples/foodapp/provider/current_index_provider.dart';
import 'package:samples/foodapp/provider/handle_state_favorite_button.dart';

import 'package:samples/foodapp/screens/foodscreen.dart';

import 'foodapp/provider/handle_animated_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HandleAnimation(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandleStateFavoriteButton(),
        ),
        ChangeNotifierProvider(
          create: (_) => CurrentItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandleAnimatedList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodScreen(),
      ),
    );
  }
}
