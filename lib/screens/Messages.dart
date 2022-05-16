import 'package:flutter/material.dart';
import 'package:foodie/constants.dart';
import 'package:foodie/screens/ChatScreen.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text(
                'Messages',
                style: TextMinor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                  child: ListView(
                children: [
                  MessageTile(
                    name: 'Bear Pastries',
                    time: '11;30',
                    msg: 'Your order has been dispatched',
                    image: AssetImage('assets/images/aduke.jpg'),
                  ),
                  MessageTile(
                    name: 'Mannies',
                    time: '30 minutes',
                    msg: 'Welcome to Mannies kitchen',
                    image: AssetImage('assets/images/egusiSoup.JPG'),
                  ),
                  MessageTile(
                    name: 'Men\'s kitchen',
                    time: '45 minutes',
                    msg: 'Hello Remi',
                    image: AssetImage('assets/images/afangSoup.jpg'),
                  ),
                  MessageTile(
                    name: 'Maland',
                    time: '1:30',
                    msg: 'Thank You',
                    image: AssetImage('assets/images/chefman.jpg'),
                  ),
                  MessageTile(
                    name: 'A\' la carte',
                    time: '6 hours ago',
                    msg: 'Your order is ready',
                    image: AssetImage('assets/images/chefrice.jpg'),
                  ),
                  MessageTile(
                    name: 'Eno\'s',
                    time: '1 hour ago',
                    msg: 'Thank You',
                    image: AssetImage('assets/images/chefhands.jpg'),
                  ),
                  MessageTile(
                    name: 'Bear Pastries',
                    time: '11;30',
                    msg: 'Your order has been dispatched',
                    image: AssetImage('assets/images/chefguy.jpeg'),
                  ),
                  MessageTile(
                    name: 'Food Court',
                    time: 'Tue',
                    msg: 'Hi',
                    image:
                        AssetImage('assets/images/obineme_youngguns9119_5.jpg'),
                  ),
                  MessageTile(
                    name: 'Tasties',
                    time: 'Mon',
                    msg: 'Hello Again',
                    image: AssetImage('assets/images/Tunde-Wey.jpg'),
                  ),
                  MessageTile(
                    name: 'Maland',
                    time: '10:20',
                    msg: 'You\'ll get your order soon',
                    image: AssetImage('assets/images/riceAndStew.jpeg'),
                  ),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  ImageProvider image;
  String name;
  String time;
  String msg;
  MessageTile({
    required this.image,
    required this.msg,
    required this.name,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chatscreen(image: image, name: name)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: image, fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: nameText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            msg,
                            style: TextMinorWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: TextMinorWhite,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
              child: Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
