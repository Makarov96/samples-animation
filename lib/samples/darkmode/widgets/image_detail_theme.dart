import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samples/samples/darkmode/bloc/handle_theme_bloc/handle_theme_bloc.dart';

class ImageDetailTheme extends StatelessWidget {
  ImageDetailTheme({
    Key key,
    @required this.onChanged,
  }) : super(key: key);
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: mediaQuery.height * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<HandleThemeBloc, HandleThemeState>(
            builder: (context, state) {
              if (state is ChangedTheme) {
                return Center(
                  child: Image.asset(
                    state.value
                        ? 'assets/darkmode/moon.png'
                        : 'assets/darkmode/sun.png',
                    width: mediaQuery.width * 0.6,
                  ),
                );
              } else {
                return Center(
                  child: Image.asset(
                    'assets/darkmode/sun.png',
                    width: mediaQuery.width * 0.6,
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            'Choose Between',
            style: TextStyle(
              color: Color(0xFF96A6B6),
              fontSize: 30.0,
            ),
          ),
          Text(
            'Light and Dark Mode',
            style: TextStyle(
              color: Color(0xFF96A6B6),
              fontSize: 30.0,
            ),
          ),
          Center(
            child: BlocBuilder<HandleThemeBloc, HandleThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state is ChangedTheme ? state.value : false,
                  activeColor: Colors.grey[500],
                  activeTrackColor: Colors.white,
                  inactiveThumbColor: Colors.black,
                  onChanged: onChanged,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
