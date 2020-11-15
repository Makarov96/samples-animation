import 'package:flutter/material.dart';

class HeaderFoodAppPagination extends StatelessWidget {
  const HeaderFoodAppPagination({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenwiHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: screenwiHeight * 0.04,
        margin: EdgeInsets.symmetric(
          horizontal: screenwidth * 0.02,
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: null,
            ),
            Text(
              'Category',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              width: screenwidth * 0.5,
            ),
            Text(
              '2/16',
              style: TextStyle(
                fontSize: 23.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
