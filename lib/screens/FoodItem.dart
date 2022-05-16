import 'dart:ui';
import 'package:foodie/constants.dart';
import 'package:flutter/material.dart';

Widget icon = Icon(
  Icons.favorite_border,
  color: Colors.white,
);
bool isSelected = false;

class MealDetailPage extends StatefulWidget {
  final ImageProvider image;
  final String price;
  final String name;
  MealDetailPage(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  late ImageProvider image;
  late String name;
  late String price;

  void changeIcon(bool check) {
    if (check == true) {
      icon = Icon(
        Icons.favorite_outlined,
        color: Colors.red,
      );
    } else {
      icon = Icon(
        Icons.favorite_border,
        color: Colors.white,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.image;
    name = widget.name;
    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(),
          Positioned(
            top: 325,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: 413,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(fit: BoxFit.cover, image: image)),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 413,
              decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 0,
            left: 8,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Positioned(
                top: 0,
                left: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/back.png'))),
                ),
              ),
            ),
          ),
          Positioned(
            top: 320,
            child: ClipRect(
              child: BackdropFilter(
                blendMode: BlendMode.srcATop,
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  isSelected = !isSelected;
                                  setState(() {
                                    changeIcon(isSelected);
                                  });
                                },
                                child: icon),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          staricon,
                          staricon,
                          staricon,
                          staricon,
                          stariconUnstyled,
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 250,
                        child: Text(
                          'Our delicious $name is well stocked with assorted ingredients to bring your tastebuds to life',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          'Place an order',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.87),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: 412,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
