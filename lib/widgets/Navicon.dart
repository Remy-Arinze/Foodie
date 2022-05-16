import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  IconData icon;
  Color color;
  double size;

  NavIcon({
    required this.icon,
    required this.size,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: color,
          size: size,
        ));
  }
}
