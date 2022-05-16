import 'package:flutter/material.dart';

class mealsNavigation extends StatelessWidget {
  String meal;
  Color color;
  Color textColor;
  mealsNavigation({
    required this.meal,
    this.color = Colors.white,
    this.textColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
        child: Text(
          meal,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
