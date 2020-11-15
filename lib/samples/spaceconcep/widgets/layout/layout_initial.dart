import 'package:flutter/material.dart';
import 'package:samples/samples/spaceconcep/const/const.dart';
import 'package:samples/samples/spaceconcep/pages/home_page.dart';

class LayoutInitialPage extends StatelessWidget {
  const LayoutInitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        StructureHeaderInitialPage(),
        Container(
          margin: EdgeInsets.only(top: screenHeigth * 0.1),
          width: double.infinity,
          height: screenHeigth * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(FromAssets.initial_page_image),
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: StructureBottomInfo(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.09,
            ).copyWith(bottom: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TextValues.skipstep,
                  style: TextStyle(
                    fontFamily: 'MarkRegular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StructureBottomInfo extends StatelessWidget {
  const StructureBottomInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.09,
      ).copyWith(bottom: screenHeigth * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: TextValues.exploreinitialpage,
                        style: TextStyle(
                          fontFamily: 'Mark',
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: TextValues.universe,
                        style: TextStyle(
                          fontFamily: 'MarkRegular',
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: TextValues.initialdowntext,
                        style: TextStyle(
                          fontFamily: 'MarkRegular',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 50,
                  color: Colors.black,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class StructureHeaderInitialPage extends StatelessWidget {
  const StructureHeaderInitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: TextValues.bottomtextvalueOne,
                    style: TextStyle(
                      fontFamily: 'Mark',
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: TextValues.bottomtextvalueTwo,
                    style: TextStyle(
                      fontFamily: 'MarkRegular',
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
