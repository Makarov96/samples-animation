import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class Book {
  final String bookPath;
  final Color color;
  final String bookname;
  final String bookDetail;

  Book({
    @required this.bookPath,
    @required this.color,
    @required this.bookname,
    @required this.bookDetail,
  });
}
