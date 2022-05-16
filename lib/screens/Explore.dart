import 'package:flutter/material.dart';
import 'ChannelPage.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Container(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Story(image: AssetImage('assets/images/fritata.png')),
                Story(
                  image: AssetImage('assets/images/egusiSoup.JPG'),
                ),
                Story(
                  image: AssetImage('assets/images/afangSoup.jpg'),
                ),
                Story(
                  image: AssetImage('assets/images/papAkara.jpg'),
                ),
                Story(
                  image: AssetImage('assets/images/yamStew.jpg'),
                ),
                Story(
                  image: AssetImage('assets/images/riceAndStew.jpeg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Channels(
            image: AssetImage('assets/images/aduke.jpg'),
            name: "Bear Pastries",
            subs: '7.5k',
          ),
          Channels(
            image: AssetImage('assets/images/chefman.jpg'),
            name: 'Mannies',
            subs: '1k',
          ),
          Channels(
            image: AssetImage('assets/images/chefrice.jpg'),
            name: 'Men\'s kitchen',
            subs: '660',
          ),
          Channels(
            image: AssetImage('assets/images/chefhands.jpg'),
            name: 'Spicey',
            subs: '6k',
          ),
          Channels(
            image: AssetImage('assets/images/chefguy.jpeg'),
            name: 'A\' la carte',
            subs: '2k',
          ),
          Channels(
            image: AssetImage('assets/images/iquo-ukoh.png'),
            name: 'Eno\'s ',
            subs: '2.3k',
          ),
          Channels(
            image: AssetImage('assets/images/obineme_youngguns9119_5.jpg'),
            name: 'Food Court',
            subs: '9k',
          ),
          Channels(
            image: AssetImage('assets/images/Tunde-Wey.jpg'),
            name: 'Tasties',
            subs: '15k',
          ),
        ]),
      ),
    );
  }
}

class Story extends StatelessWidget {
  ImageProvider image;
  Story({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 3,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.cover, image: image)),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}

Widget icon = Icon(
  Icons.notifications,
  color: Colors.white,
);

Widget text = Text(
  'Follow',
  style:
      TextStyle(color: Colors.red, fontSize: 17, fontWeight: FontWeight.w500),
);

bool isSelected = false;

class Channels extends StatefulWidget {
  ImageProvider image;
  String name;
  String subs;

  Channels({
    required this.name,
    required this.image,
    required this.subs,
    Key? key,
  }) : super(key: key);

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  void changeState(bool check) {
    if (check == true) {
      text = Text(
        'Following',
        style: TextStyle(
            color: Colors.grey, fontSize: 17, fontWeight: FontWeight.w500),
      );
    } else {
      text = Text(
        'Follow',
        style: TextStyle(
            color: Colors.red, fontSize: 17, fontWeight: FontWeight.w500),
      );
    }
  }

  void changeStatenotification(bool check) {
    if (check == true) {
      icon = Icon(
        Icons.notifications_active,
        color: Colors.white,
      );
    } else {
      icon = Icon(
        Icons.notifications,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChannelPage(
                      image: widget.image,
                      name: widget.name,
                      subs: widget.subs,
                    )));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: widget.image)),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              isSelected = !isSelected;
                              setState(() {
                                changeState(isSelected);
                              });
                            },
                            child: text),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              isSelected = !isSelected;
                              setState(() {
                                changeStatenotification(isSelected);
                              });
                            },
                            child: icon)
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.subs} subscribers',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}
