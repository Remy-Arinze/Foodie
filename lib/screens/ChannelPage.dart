import 'package:flutter/material.dart';
import 'package:foodie/widgets/ResuableMeals.dart';

class ChannelPage extends StatefulWidget {
  ImageProvider image;
  String subs;
  String name;
  ChannelPage(
      {required this.name, required this.image, required this.subs, Key? key})
      : super(key: key);

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  late ImageProvider image;
  late String subs;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    image = widget.image;
    subs = widget.subs;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.red,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                image: image,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subs,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      'Subscribe',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ),
            )),
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
