import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/samples/galleryapp/bloc/handle_current_item.dart';
import 'package:samples/samples/galleryapp/data/data.dart';
import 'package:samples/samples/galleryapp/models/item.dart';
import 'package:samples/samples/galleryapp/widgets/custom_header.dart';

class ProductPageDetail extends StatefulWidget {
  const ProductPageDetail({
    Key key,
    @required this.items,
  }) : super(key: key);
  final List<Item> items;

  @override
  _ProductPageDetailState createState() => _ProductPageDetailState();
}

class _ProductPageDetailState extends State<ProductPageDetail>
    with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationControllerTwo;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );
    animationControllerTwo = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    animationController.forward();
    animationControllerTwo.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationControllerTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final handleCurrentItem = Provider.of<HandleCurrentIntem>(context);
    var controllerPage = new PageController(
        initialPage: handleCurrentItem.currentItem, viewportFraction: 0.6);

    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          CustomCardPageView(
            item: items[handleCurrentItem.currentItem],
            animationController: animationController,
          ),
          PageView.builder(
            controller: controllerPage,
            itemCount: widget.items.length,
            onPageChanged: (value) {
              handleCurrentItem.updateCurrentItem(value);
            },
            itemBuilder: (_, i) => Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: mediaQuery.height * 0.10),
                height: mediaQuery.height * 0.2,
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        widget.items[handleCurrentItem.currentItem].name,
                        style: TextStyle(
                          color: handleCurrentItem.currentItem == i
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontSize:
                              handleCurrentItem.currentItem == i ? 50 : 40,
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animationControllerTwo.view,
                      builder: (BuildContext context, Widget child) {
                        return Transform.translate(
                          offset: Offset(
                            animationControllerTwo.value,
                            animationControllerTwo.value * -50,
                          ),
                          child: child,
                        );
                      },
                      child: Container(
                        width: mediaQuery.width * 0.15,
                        height: mediaQuery.height * 0.005,
                        decoration: BoxDecoration(
                          color: handleCurrentItem.currentItem == i
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(050),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          CustomHeader(),
        ],
      ),
    );
  }
}

class CustomCardPageView extends StatefulWidget {
  const CustomCardPageView({
    Key key,
    this.item,
    this.animationController,
  }) : super(key: key);
  final Item item;
  final AnimationController animationController;

  @override
  _CustomCardPageViewState createState() => _CustomCardPageViewState();
}

class _CustomCardPageViewState extends State<CustomCardPageView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: widget.item.path,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    widget.item.firstColor,
                    widget.item.secondtColor,
                  ],
                ).createShader(bounds);
              },
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.item.path),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: AnimatedBuilder(
            animation: widget.animationController.view,
            builder: (BuildContext context, Widget child) {
              return Transform.scale(
                origin: Offset(0, 0),
                scale: widget.animationController.value * 1.0,
                child: child,
              );
            },
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: mediaQuery.height * 0.06,
                              width: mediaQuery.width * 0.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.item.path),
                                ),
                              ),
                            ),
                            Text(
                              'Flutter enable animation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: mediaQuery.height * 0.3,
                          width: mediaQuery.width * 0.8,
                          margin:
                              EdgeInsets.only(bottom: mediaQuery.height * 0.2),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(widget.item.path))),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: mediaQuery.width * 0.3).copyWith(
                      top: mediaQuery.height * 0.5,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (_, i) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            child: Text(
                              widget.item.name.substring(
                                widget.item.name.length - 1,
                              ),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          title: Text(
                            widget.item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
