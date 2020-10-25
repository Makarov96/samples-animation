import 'package:flutter/material.dart';
import 'package:samples/galleryapp/pages/home_page_gallery.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03).copyWith(
          top: screenHeight * 0.02,
        ),
        child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePageGallery()),
              );
            }),
      ),
    );
  }
}
