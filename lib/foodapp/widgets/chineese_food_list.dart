import 'package:flutter/material.dart';
import 'package:samples/foodapp/model/food.dart';
import 'package:samples/foodapp/widgets/custom_food_image.dart';

// ignore: must_be_immutable
class ChineeseFoodList extends StatelessWidget {
  ChineeseFoodList({Key key}) : super(key: key);
  var foods = [
    Food(
        foodimagepath:
            "https://www.hawaiinaturalmedicine.com/wp-content/uploads/2018/03/tropical-acai-bowl-recipe.jpg"),
    Food(
        foodimagepath:
            "https://sharedappetite.com/wp-content/uploads/2019/02/breakfast-superfood-yogurt-bowls-9-copy.jpg"),
    Food(
        foodimagepath:
            "https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/12/CerealHealthy-650x450.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
          right: screenWidth * 0.5,
          bottom: screenHeight * 0.3,
          top: screenHeight * 0.05),
      padding: EdgeInsets.only(top: 70),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: this.foods.length,
        itemBuilder: (BuildContext context, i) {
          final food = this.foods[i];
          return CustomFoodImage(food: food);
        },
      ),
    );
  }
}
