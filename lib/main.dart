import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:samples/neumorphic/presentation/home_book_page/bloc/sharedbookdetailbloc/shared_book_detail_bloc.dart';
import 'package:samples/neumorphic/presentation/home_book_page/pages/home_book_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SharedBookDetailBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeBookPage(),
      ),
    );
  }
}

/**
 * 
 * 
 *   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodAppPagination(),
    );
 */

//! hydrated_bloc
/**
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

 MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HandleThemeBloc(),
        )
      ],
      child: BlocBuilder<HandleThemeBloc, HandleThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state is ChangedTheme
                ? state.value
                    ? darkTheme
                    : lighTheme
                : lighTheme,
            debugShowCheckedModeBanner: false,
            home: DarkModeScreen(),
          );
        },
      ),
    );


 */

//?Food app
/**

 MultiProvider(
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


 */
