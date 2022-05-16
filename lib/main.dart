import 'package:flutter/material.dart';
import 'screens/FoodItem.dart';
import 'screens/Home.dart';

void main() => runApp(Foodie());

class Foodie extends StatelessWidget {
  const Foodie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black.withOpacity(0.9),
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.black.withOpacity(0.9))),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
