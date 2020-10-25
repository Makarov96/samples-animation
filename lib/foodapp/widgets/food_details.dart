import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({Key key}) : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return FoodColum();
  }
}

class FoodColum extends StatefulWidget {
  const FoodColum({
    Key key,
  }) : super(key: key);

  @override
  _FoodColumState createState() => _FoodColumState();
}

class _FoodColumState extends State<FoodColum> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 320, top: 150),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 350,
                ),
                child: Text(
                  "Pie blackberries",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Chocolate chip, walnut and \n coconut layared bar.",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )),
              Container(
                padding: EdgeInsets.only(top: 10, right: 70),
                child: Text(
                  "150cl",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 45,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  child: Text("Ingredients",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: Offset(5, 10),
                          blurRadius: 20)
                    ],
                    color: Color(0xFFFFB101),
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: -30,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(8.0, 15.0),
                    blurRadius: 20,
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/foodapp/food.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
