import 'package:flutter/material.dart';
import 'package:samples/spaceconcep/const/colors.dart';

import 'package:samples/spaceconcep/const/const.dart';
import 'package:samples/spaceconcep/pages/about_page.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BackgroundImage(),
          ),
          Center(
            child: Transform.rotate(
              angle: 50,
              child: Container(
                margin: EdgeInsets.only(
                  top: screenHeigth * 0.17,
                ),
                width: 1500.0,
                height: screenHeigth * 0.05,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.customcolorlightblue.withOpacity(0.5),
                      blurRadius: 35,
                      spreadRadius: 10,
                    )
                  ],
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Structure(),
        ],
      ),
    );
  }
}

class Structure extends StatelessWidget {
  const Structure({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeigth * 0.02,
        horizontal: screenHeigth * 0.05,
      ).copyWith(top: screenHeigth * 0.05),
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Ink(
              width: 50,
              height: 50,
              child: Icon(
                Icons.close,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: TextValues.titlehomeOne,
                    style: TextStyle(
                      fontFamily: 'Mark',
                      fontWeight: FontWeight.w700,
                      fontSize: 80,
                    ),
                  ),
                  TextSpan(
                    text: TextValues.titlehomeTwo,
                    style: TextStyle(
                      fontFamily: 'MarkRegular',
                      fontWeight: FontWeight.w400,
                      fontSize: 60,
                    ),
                  ),
                  TextSpan(
                    text: TextValues.titledetails,
                    style: TextStyle(
                      fontFamily: 'MarkRegular',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: TextValues.viewmore,
                    style: TextStyle(
                      fontFamily: 'MarkRegular',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: screenHeigth * 0.5),
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
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(FromAssets.worldhomeimage),
        ),
      ),
    );
  }
}
