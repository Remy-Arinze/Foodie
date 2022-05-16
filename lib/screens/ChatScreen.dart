import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  ImageProvider image;
  String name;

  Chatscreen({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  late ImageProvider image;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.image;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            height: 50,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.cover, image: image),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(name)
        ]),
      ),
    );
  }
}
