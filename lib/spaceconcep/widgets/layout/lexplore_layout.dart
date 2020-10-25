import 'package:flutter/material.dart';
import 'package:samples/spaceconcep/const/colors.dart';
import 'package:samples/spaceconcep/const/const.dart';
import 'package:samples/widget/custom_nav_bar.dart';
import 'package:samples/widget/header.dart';

class ExploreLayout extends StatelessWidget {
  const ExploreLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          BackgroundImageExplore(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomImage(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomHeader(),
          ),
          StructureDataExplorePage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavBar(),
          )
        ],
      ),
    );
  }
}

class StructureDataExplorePage extends StatelessWidget {
  const StructureDataExplorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05)
          .copyWith(top: screenHeigth * 0.10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeigth * 0.15,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 80,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
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
                    color: CustomColors.customcircleplannet.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  TextValues.explore,
                  style: TextStyle(
                    fontFamily: 'Mark',
                    fontWeight: FontWeight.w400,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            TextValues.exploredowntext,
            style: TextStyle(
              fontFamily: 'MarkRegular',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomImage extends StatelessWidget {
  const CustomBottomImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeigth / 1.5,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(FromAssets.planet_explore_page),
      )),
    );
  }
}

class BackgroundImageExplore extends StatelessWidget {
  const BackgroundImageExplore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(FromAssets.backgroundimageexplore),
        ),
      ),
    );
  }
}
