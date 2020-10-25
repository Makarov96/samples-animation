import 'package:flutter/cupertino.dart';

class Food {
  final String foodimagepath;
  final String foodname;
  final String fooddescription;
  Food({
    Key key,
    @required this.foodimagepath,
    this.foodname,
    this.fooddescription,
  });
}
