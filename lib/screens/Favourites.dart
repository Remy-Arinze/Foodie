import 'package:flutter/material.dart';
import 'package:foodie/widgets/Meals.dart';
import 'package:foodie/widgets/ResuableMeals.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 20,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/Foodplug logo.png'))),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.more_vert)
          ],
        ),
        body: ListView(
          children: [
            FavMeal(
              image: AssetImage('assets/images/fritata.png'),
              price: "N2500",
              name: "Beef Burger",
            ),
            SizedBox(height: 20),
            FavMeal(
              image: AssetImage('assets/images/egusiSoup.JPG'),
              price: "N2000",
              name: "Egusi With Eba",
            ),
            SizedBox(height: 20),
            FavMeal(
              image: AssetImage('assets/images/afangSoup.jpg'),
              price: "N3850",
              name: "Afang Soup With Eba",
            ),
            SizedBox(height: 20),
            FavMeal(
              image: AssetImage('assets/images/papAkara.jpg'),
              price: "N1000",
              name: "Pap and akara",
            ),
            SizedBox(height: 20),
            FavMeal(
              image: AssetImage('assets/images/yamStew.jpg'),
              price: "N2000",
              name: "yam and stew",
            ),
            SizedBox(height: 20),
            FavMeal(
              image: AssetImage('assets/images/riceAndStew.jpeg'),
              price: "N2000",
              name: "Rice and stew with fried chicken",
            ),
            SizedBox(height: 20),
          ],
        ));
  }
}
