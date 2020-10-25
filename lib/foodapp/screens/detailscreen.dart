import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/foodapp/data/tab_data.dart';
import 'package:samples/foodapp/model/food.dart';
import 'package:samples/foodapp/provider/current_index_provider.dart';
import 'package:samples/foodapp/provider/handle_animated_list.dart';
import 'package:samples/foodapp/provider/handle_state_favorite_button.dart';
import 'package:samples/foodapp/screens/foodscreen.dart';

import 'package:samples/foodapp/widgets/backgrouncolor.dart';
import 'package:samples/galleryapp/models/item.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  TabController tabController;
  AnimationController animationController;
  ScrollController scrollController = ScrollController();

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    tabController =
        TabController(vsync: this, length: TabDataInfo().getTabData.length);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final handlestatefavorebutton =
        Provider.of<HandleStateFavoriteButton>(context);

    final currentIndex =
        Provider.of<CurrentItemProvider>(context, listen: true);
    final handleanimatedlist =
        Provider.of<HandleAnimatedList>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: [
          BackgrounColor(width: 0.5),
          Container(
            margin: EdgeInsets.only(
              top: mediaQuery.height * 0.05,
            ),
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              indicatorWeight: 0.1,
              onTap: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodScreen(),
                    ),
                  );
                  handleanimatedlist.resetCounter();
                } else if (value == 1) {
                  animationController.forward();

                  handleanimatedlist.incrementArrayFood(
                    [
                      Food(
                        foodimagepath: 'assets/foodapp/food.png',
                        foodname: 'CristapBerry',
                        fooddescription: '600',
                      ),
                      Food(
                        foodimagepath: 'assets/foodapp/food2.png',
                        foodname: 'Valley Form Eggs',
                        fooddescription: '600',
                      ),
                      Food(
                        foodimagepath: 'assets/foodapp/food3.png',
                        foodname: 'Stake Protohouse',
                        fooddescription: '600',
                      ),
                    ],
                  );
                }

                currentIndex.updateCurrenItem(value);
              },
              controller: tabController,
              tabs: List.generate(
                TabDataInfo().getTabData.length,
                (index) => TabFoorItems(
                  index: index,
                  text: TabDataInfo().getTabData[index],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animationController.view,
            child: Center(
              child: Hero(
                tag: '20',
                child: Container(
                  height: 800,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://image.freepik.com/foto-gratis/superficie-pared-marmol-patron-azul-grietas_23-2148327727.jpg'))),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                    animationController.value * 400,
                    animationController.value * 110,
                  ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController.view,
            child: Hero(
              tag: 'holaomo',
              child: Container(
                margin: EdgeInsets.only(
                  top: mediaQuery.height * 0.45,
                  left: mediaQuery.width * 0.35,
                ),
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/foodapp/food2.png"),
                  ),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                    animationController.value * 400,
                    animationController.value * 110,
                  ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController.view,
            child: AnimatedOpacity(
              duration: animationController.duration,
              opacity: animationController.isAnimating ? 0.0 : 1.0,
              child: Container(
                margin: EdgeInsets.only(
                  top: mediaQuery.height * 0.18,
                  left: mediaQuery.width * 0.18,
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * 0.04,
                      ).copyWith(
                        top: mediaQuery.height * 0.02,
                      ),
                      height: 200,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Valley Farm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 35,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  handlestatefavorebutton.isfavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: handlestatefavorebutton.isfavorite
                                      ? Colors.red
                                      : Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {
                                  handlestatefavorebutton.isfavorite
                                      ? handlestatefavorebutton
                                          .iLikedFood(false)
                                      : handlestatefavorebutton
                                          .iLikedFood(true);
                                },
                              )
                            ],
                          ),
                          Text(
                            'Eggs',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Container(
                            width: mediaQuery.width * 0.2,
                            height: mediaQuery.height * 0.005,
                            margin: EdgeInsets.only(
                              top: mediaQuery.height * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow[400],
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                    animationController.value * 400,
                    animationController.value * 110,
                  ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController.view,
            child: AnimatedOpacity(
              duration: animationController.duration,
              opacity: animationController.isAnimating ? 0.0 : 1.0,
              child: Container(
                margin: EdgeInsets.only(
                  top: mediaQuery.height * 0.75,
                  left: mediaQuery.width * 0.17,
                ),
                child: Text(
                  '120cl',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return child;
            },
          ),
          Container(
            margin: EdgeInsets.only(
              top: mediaQuery.height * 0.4,
              right: mediaQuery.width * 0.2,
            ),
            child: ListView.builder(
              itemCount: handleanimatedlist.items.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, i) {
                return slideIt(context, i);
              },
            ),
          ),
          AnimatedBuilder(
            animation: animationController.view,
            child: AnimatedOpacity(
              opacity: animationController.isAnimating ? 1.0 : 0.0,
              duration: animationController.duration,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: mediaQuery.width * 0.8,
                  height: mediaQuery.height * 0.06,
                  margin: EdgeInsets.only(top: mediaQuery.height * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color(
                            0xFFFFB800,
                          ),
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.w700,
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 7,
                            spreadRadius: 2,
                            offset: Offset(
                              0,
                              10,
                            ))
                      ]),
                ),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return child;
            },
          ),
        ],
      ),
    );
  }

  Widget slideIt(BuildContext context, int index) {
    final handleanimatedlist =
        Provider.of<HandleAnimatedList>(context, listen: true);
    Food item = handleanimatedlist.items[index];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animationController.view,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut,
        ),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 128.0,
            width: 500,
            margin: EdgeInsets.only(
              bottom: 40.0,
            ),
            child: Card(
              child: Container(
                padding: EdgeInsets.only(
                  top: 35.0,
                  right: 40.0,
                ),
                child: Text(
                  '${item.foodname}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    item.foodimagepath,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabFoorItems extends StatelessWidget {
  const TabFoorItems({
    Key key,
    @required this.text,
    @required this.index,
  }) : super(key: key);
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        Provider.of<CurrentItemProvider>(context, listen: true);

    return Container(
      width: 150,
      height: 60,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color:
                currentIndex.currentItem == index ? Colors.white : Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: currentIndex.currentItem == index
              ? Color(0xFfFFB80D)
              : Colors.transparent),
    );
  }
}
