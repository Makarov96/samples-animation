import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/galleryapp/bloc/handle_current_item.dart';
import 'package:samples/galleryapp/data/data.dart';
import 'package:samples/galleryapp/models/item.dart';
import 'package:samples/galleryapp/pages/product_page_detail.dart';

class HomePageGallery extends StatefulWidget {
  const HomePageGallery({Key key}) : super(key: key);

  @override
  _HomePageGalleryState createState() => _HomePageGalleryState();
}

class _HomePageGalleryState extends State<HomePageGallery>
    with TickerProviderStateMixin {
  var currentIndex = 0;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: screenWidth * 0.2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF333560),
            ),
          ),
          Expanded(
            child: AnimatedList(
              padding: EdgeInsets.only(
                top: 0,
              ),
              initialItemCount: items.length,
              itemBuilder: (_, i, animateConr) {
                return GestureDetector(
                  onTap: () {
                    animationController.forward();

                    setState(
                      () {
                        currentIndex = i;
                      },
                    );

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, animation1, animation2) {
                          return ProductPageDetail(
                            items: items,
                          );
                        },
                        transitionsBuilder:
                            (context, animation1, animation2, child) {
                          return FadeTransition(
                            opacity: animation1,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 400),
                      ),
                    );

                    Provider.of<HandleCurrentIntem>(context, listen: false)
                        .updateCurrentItem(currentIndex);
                  },
                  child: AnimatedBuilder(
                    animation: animationController.view,
                    builder: (BuildContext context, Widget child) {
                      return Transform.translate(
                        offset: Offset(
                          currentIndex != i
                              ? i == 0
                                  ? animationController.value * -800
                                  : animationController.value * 500
                              : 0,
                          currentIndex == i
                              ? currentIndex == 0
                                  ? 0
                                  : animationController.value * -200
                              : i == 2 || i == 3
                                  ? animationController.value * -1100
                                  : 0,
                        ),
                        child: child,
                      );
                    },
                    child: CustomImageContainer(
                      item: items[i],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    Key key,
    @required this.item,
  }) : super(
          key: key,
        );

  final Item item;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      overflow: Overflow.visible,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                item.firstColor,
                item.secondtColor,
              ],
            ).createShader(bounds);
          },
          child: Hero(
            tag: item.path,
            child: Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(item.path),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.1,
          left: -50,
          child: Text(
            item.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45.0,
            ),
          ),
        ),
      ],
    );
  }
}
