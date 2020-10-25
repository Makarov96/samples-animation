import 'package:flutter/material.dart';
import 'package:samples/foodapp/model/food.dart';

class CustomFoodImage extends StatelessWidget {
  final Food food;

  CustomFoodImage({Key key, @required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(food.foodimagepath);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 50, left: 45, right: 45),
        height: 110.0,
        width: 110.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(this.food.foodimagepath)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 15,
                offset: Offset(0, 10),
              )
            ]),
      ),
    );
  }
}
