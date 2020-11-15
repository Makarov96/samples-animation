import 'package:flutter/cupertino.dart';

class TabDataInfo extends ChangeNotifier {
  var _tabData = [
    'BreakFast',
    'Dinner',
    'Evenning',
  ];

  List get getTabData => _tabData;
}
