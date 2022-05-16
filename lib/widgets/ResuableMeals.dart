import 'package:flutter/material.dart';
import 'package:foodie/screens/FoodItem.dart';

Widget icon = Icon(Icons.favorite_border);
bool isSelected = false;

class FavMeal extends StatefulWidget {
  ImageProvider image;
  String name;
  String price;

  FavMeal({
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  State<FavMeal> createState() => _FavMealState();
}

class _FavMealState extends State<FavMeal> {
  //? function for ICon change

  void changeIcon(bool check) {
    if (check == true) {
      icon = Icon(
        Icons.favorite_outlined,
        color: Colors.red,
      );
    } else {
      icon = Icon(Icons.favorite_border);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealDetailPage(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price)));
        },
        child: Container(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 225,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: widget.image),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    top: 15,
                    left: 15,
                    child: GestureDetector(
                        onTap: () {
                          isSelected = !isSelected;
                          setState(() {
                            changeIcon(isSelected);
                          });
                        },
                        child: icon))
              ]),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
