import 'package:flutter/material.dart';
import 'package:samples/samples/spaceconcep/const/colors.dart';
import 'package:samples/samples/spaceconcep/const/const.dart';
import 'package:samples/samples/spaceconcep/pages/explore_page.dart';
import 'package:samples/samples/widget/custom_nav_bar.dart';
import 'package:samples/samples/widget/header.dart';

class AboutLayout extends StatelessWidget {
  const AboutLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgrounImageAboutPage(),
        Align(
          alignment: Alignment.topCenter,
          child: StructureTopInfo(),
        ),
        Container(
          height: screenHeigth * 0.05,
          margin: EdgeInsets.only(top: screenHeigth * 0.2),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: TextValues.planets.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(
                right: screenWidth * 0.2,
                left: screenWidth * 0.1,
              ),
              child: Center(
                child: Text(
                  TextValues.planets[i],
                  style: TextStyle(
                    fontFamily: 'Markregular',
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: TextValues.planets[0] == 'Earth'
                        ? Colors.white.withOpacity(0.5)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        StructureBottomLeftInfo(),
        StructureCenteDetail(),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomNavBar(),
        ),
      ],
    );
  }
}

class StructureCenteDetail extends StatelessWidget {
  const StructureCenteDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin:
          EdgeInsets.only(top: screenHeigth * 0.28, left: screenWidth * 0.2),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.customcolorlightblue.withOpacity(0.5),
                    blurRadius: 35,
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 310,
            width: 310,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[500].withOpacity(0.5),
                width: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: Image.asset(
              FromAssets.centerplanet,
            ),
          ),
          Positioned(
            top: screenHeigth * 0.09,
            left: screenWidth * 0.02,
            child: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.customcircleplannet,
              ),
            ),
          ),
          Positioned(
            top: screenHeigth * 0.028,
            left: screenWidth * 0.4,
            child: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.customcircleplannet,
              ),
            ),
          ),
          Positioned(
            top: screenHeigth * 0.23,
            left: screenWidth * 0.32,
            child: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.customcircleplannet,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StructureBottomLeftInfo extends StatelessWidget {
  const StructureBottomLeftInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          bottom: screenHeigth * 0.15,
          left: screenWidth * 0.05,
          right: screenWidth * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: TextValues.textbodybottominfoOne,
                  style: TextStyle(
                    fontFamily: 'Mark',
                    fontWeight: FontWeight.w700,
                    fontSize: 60,
                  ),
                ),
                TextSpan(
                  text: TextValues.textbodybottominfoTwo,
                  style: TextStyle(
                    fontFamily: 'MarkRegular',
                    fontWeight: FontWeight.w400,
                    fontSize: 50,
                  ),
                ),
                TextSpan(
                  text: TextValues.textboydbottominfodown,
                  style: TextStyle(
                    fontFamily: 'MarkRegular',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                TextValues.viewmore,
                style: TextStyle(
                    fontFamily: 'MarkRegular',
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.white),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExplorePage(),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class StructureTopInfo extends StatelessWidget {
  const StructureTopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(),
        SearchBar(),
      ],
    );
  }
}

class BottomInfo extends StatelessWidget {
  const BottomInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: screenHeigth * 0.05),
      width: screenWidth * 0.7,
      height: screenHeigth * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 40,
              color: Colors.white.withOpacity(0.7),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            TextValues.textsearchbar,
            style: TextStyle(
              fontFamily: 'MarkRegular',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

class BackgrounImageAboutPage extends StatelessWidget {
  const BackgrounImageAboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            FromAssets.backgroundimage,
          ),
        ),
      ),
    );
  }
}
