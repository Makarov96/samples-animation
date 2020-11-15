import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Item {
  final String name;
  final String path;
  final Color firstColor;
  final Color secondtColor;

  Item({
    @required this.name,
    @required this.path,
    @required this.firstColor,
    @required this.secondtColor,
  })  : assert(name != null),
        assert(path != null),
        assert(firstColor != null),
        assert(secondtColor != null);
}
