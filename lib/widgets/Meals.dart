import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:foodie/screens/FoodItem.dart';
import 'package:foodie/constants.dart';

Widget icon = Icon(Icons.favorite_outline);
bool isSelected = false;

class Meals extends StatefulWidget {
  String image;
  String title;
  String price;

  Meals({
    required this.image,
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  void changeIcon(bool name) {
    if (name == true) {
      icon = Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      icon = Icon(Icons.favorite_border_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealDetailPage(
                      image: AssetImage(widget.image),
                      name: widget.title,
                      price: widget.price,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                            changeIcon(!isSelected);
                          });
                        },
                        child: icon))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        staricon,
                        staricon,
                        staricon,
                        staricon,
                        stariconUnstyled
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
