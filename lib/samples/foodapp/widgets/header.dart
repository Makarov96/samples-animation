import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Widget headerWidget(screenWidth, screenHeight) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.05),
                    width: screenWidth * 0.009,
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(color: Color(0xFFFFB000))),
                Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text("Fine  dining",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30)))
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.view_headline,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.03),
      child: this.headerWidget(screenWidth, screenHeight),
    );
  }
}
