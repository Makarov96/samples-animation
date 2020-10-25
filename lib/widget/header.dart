import 'package:flutter/material.dart';
import 'package:samples/spaceconcep/const/const.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 100.0),
              child: IconButton(
                icon: Image.asset(
                  FromAssets.options,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 120.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: TextValues.bottomtextvalueOne,
                      style: TextStyle(
                        fontFamily: 'Mark',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: TextValues.bottomtextvalueTwo,
                      style: TextStyle(
                        fontFamily: 'MarkRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
