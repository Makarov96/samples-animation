import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samples/samples/darkmode/bloc/handle_theme_bloc/handle_theme_bloc.dart';
import 'package:samples/samples/darkmode/painter/ripple_animation.dart';
import 'package:samples/samples/darkmode/widgets/image_detail_theme.dart';

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({Key key}) : super(key: key);

  @override
  _DarkModeScreenState createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen>
    with TickerProviderStateMixin {
  AnimationController animationControllerLightTheme;

  @override
  void initState() {
    animationControllerLightTheme = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    animationControllerLightTheme.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllerLightTheme.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationControllerLightTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HandleThemeBloc, HandleThemeState>(
            builder: (context, state) {
              if (state is ChangedTheme) {
                return Positioned(
                  left: state.value ? 5 : 0,
                  top: state.value ? 0 : 2,
                  child: RipplesAnimation(
                    color: state.value ? Color(0xFFDBE3E2) : Color(0xFFFCC500),
                    size: state.value ? 131 : 131,
                    child: SizedBox(),
                  ),
                );
              } else {
                return RipplesAnimation(
                  color: Color(0xFFFCC500),
                  size: 133,
                  child: SizedBox(),
                );
              }
            },
          ),
          ImageDetailTheme(
            onChanged: (change) {
              BlocProvider.of<HandleThemeBloc>(context).add(
                ChangedValueEvent(value: change),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RandomPositionedContainer extends StatelessWidget {
  const RandomPositionedContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class BlurAnimationSun extends StatelessWidget {
  const BlurAnimationSun({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Color(0xFFFDB800),
        shape: BoxShape.circle,
      ),
    );
  }
}
