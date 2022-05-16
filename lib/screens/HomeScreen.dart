import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:foodie/widgets/mealsNav.dart';
import 'package:foodie/widgets/Navicon.dart';
import 'package:foodie/widgets/Meals.dart';
import 'package:foodie/data/foodItems.dart';

Color inactive = Colors.white;
Color inactiveText = Color(0XFF5656565);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color BfColor = inactive;
  Color BfText = inactiveText;
  Color LnchColor = inactive;
  Color LnchText = inactiveText;
  Color DinnerCOlor = inactive;
  Color DinnerText = inactiveText;
  Color AllColor = Colors.green;
  Color AllText = Colors.white;

  String foodType = 'All';

  List<Widget> displayWidgets(String type) {
    List<Widget> meals = all();
    if (type == 'All') {
      meals = all();
    } else if (type == 'Breakfast') {
      meals = breakfast();
    } else if (type == 'Lunch') {
      meals = lunchData();
    } else if (type == 'Dinner') {
      meals = dinner();
    }

    return meals;
  }

  List<Widget> lunchData() {
    List<Meals> lunchmeal = [];
    for (var i = 0; i < Lunch.length; i++) {
      var newMeal = Meals(
          image: Lunch[i]['img'],
          title: Lunch[i]['title'],
          price: Lunch[i]['price']);

      lunchmeal.add(newMeal);
    }
    return lunchmeal;
  }

  List<Widget> all() {
    List<Meals> meal = [];
    for (var i = 0; i < All.length; i++) {
      var newMeal = Meals(
          image: All[i]['img'], title: All[i]['title'], price: All[i]['price']);

      meal.add(newMeal);
    }
    return meal;
  }

  List<Widget> breakfast() {
    List<Meals> meal = [];
    for (var i = 0; i < Breakfast.length; i++) {
      var newMeal = Meals(
          image: Breakfast[i]['img'],
          title: Breakfast[i]['title'],
          price: Breakfast[i]['price']);

      meal.add(newMeal);
    }
    return meal;
  }

  List<Widget> dinner() {
    List<Meals> meal = [];
    for (var i = 0; i < Dinner.length; i++) {
      var newMeal = Meals(
          image: Dinner[i]['img'],
          title: Dinner[i]['title'],
          price: Dinner[i]['price']);

      meal.add(newMeal);
    }
    return meal;
  }

  void ChangeColor(String name) {
    if (name == 'Breakfast') {
      if (BfColor == inactive && BfText == inactiveText) {
        BfColor = Colors.green;
        BfText = Colors.white;
        LnchColor = inactive;
        LnchText = inactiveText;
        DinnerCOlor = inactive;
        DinnerText = inactiveText;
        AllText = inactiveText;
        AllColor = inactive;
      }
    } else if (name == 'Lunch') {
      if (LnchColor == inactive && LnchText == inactiveText) {
        LnchColor = Colors.green;
        LnchText = Colors.white;
        DinnerCOlor = inactive;
        DinnerText = inactiveText;
        AllText = inactiveText;
        AllColor = inactive;
        BfColor = inactive;
        BfText = inactiveText;
      }
    } else if (name == 'Dinner') {
      if (DinnerCOlor == inactive && DinnerText == inactiveText) {
        DinnerCOlor = Colors.green;
        DinnerText = Colors.white;
        AllText = inactiveText;
        AllColor = inactive;
        BfColor = inactive;
        BfText = inactiveText;
        LnchColor = inactive;
        LnchText = inactiveText;
      }
    } else if (name == 'All') {
      if (AllColor == inactive && AllText == inactiveText) {
        AllColor = Colors.green;
        AllText = Colors.white;
        BfColor = inactive;
        BfText = inactiveText;
        LnchColor = inactive;
        LnchText = inactiveText;
        DinnerCOlor = inactive;
        DinnerText = inactiveText;
      }
    } else {
      inactive = Colors.white;
      inactiveText = Color(0XFF5656565);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/mayan.jpg'))),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    child: Row(
                      children: [
                        SafeArea(
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ChangeColor('Dinner');
                                      foodType = 'Dinner';
                                    });
                                  },
                                  child: mealsNavigation(
                                    textColor: DinnerText,
                                    color: DinnerCOlor,
                                    meal: 'Dinner',
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ChangeColor('Lunch');
                                      foodType = 'Lunch';
                                    });
                                  },
                                  child: mealsNavigation(
                                    meal: 'Lunch',
                                    textColor: LnchText,
                                    color: LnchColor,
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ChangeColor('Breakfast');
                                      foodType = 'Breakfast';
                                    });
                                  },
                                  child: mealsNavigation(
                                    meal: 'Breakfast',
                                    textColor: BfText,
                                    color: BfColor,
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ChangeColor('All');
                                      foodType = 'All';
                                    });
                                  },
                                  child: mealsNavigation(
                                    meal: 'All',
                                    color: AllColor,
                                    textColor: AllText,
                                  ),
                                )),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: (Radius.circular(50)))),
                            width: 80,
                            height: MediaQuery.of(context).size.height * 0.9,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              child: SafeArea(
                                child: ListView(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/Foodplug logo.png'))),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.notifications,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      child: Text(
                                        "Explore your delicious side",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Column(children: displayWidgets(foodType))
                                    // TOdo add the body of the meals
                                  ],
                                ),
                              ),
                              color: Colors.transparent,
                              height: double.infinity,
                              width: 400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
          ),
        ),
      ],
    );
  }
}
