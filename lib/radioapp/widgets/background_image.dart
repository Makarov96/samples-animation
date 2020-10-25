import 'package:flutter/material.dart';

class BackhgroundImage extends StatelessWidget {
  const BackhgroundImage({Key key, @required this.path})
      : assert(path != null),
        super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            path,
          ),
        ),
      ),
    );
  }
}

class BackhgroundImageTwo extends StatelessWidget {
  const BackhgroundImageTwo({Key key, @required this.path})
      : assert(path != null),
        super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Color(0xFF1D133E),
            BlendMode.softLight,
          ),
          fit: BoxFit.fill,
          image: AssetImage(
            path,
          ),
        ),
      ),
    );
  }
}
