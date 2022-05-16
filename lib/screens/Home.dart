import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:foodie/screens/Settings.dart';
import 'package:foodie/screens/Favourites.dart';
import 'package:foodie/screens/Messages.dart';
import 'package:foodie/screens/Explore.dart';
import 'package:foodie/screens/HomeScreen.dart';

import 'package:foodie/widgets/mealsNav.dart';
import 'package:foodie/widgets/Navicon.dart';
import 'package:foodie/widgets/Meals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List Pages = <Widget>[
    HomeScreen(),
    Explore(),
    Messages(),
    Favourites(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          iconSize: 26,
          selectedItemColor: Colors.green,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedItemColor: Color(0XffE5E5E5),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 13),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
                label: 'home',
                icon: Icon(
                  Icons.home_rounded,
                )),
            BottomNavigationBarItem(
                label: 'explore',
                icon: Icon(
                  Icons.explore_outlined,
                )),
            BottomNavigationBarItem(
                label: 'messages', icon: Icon(Icons.chat_rounded)),
            BottomNavigationBarItem(
                label: 'favorites',
                icon: Icon(
                  Icons.favorite_outline,
                )),
            BottomNavigationBarItem(label: 'account', icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
