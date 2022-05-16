import 'package:flutter/material.dart';
import 'package:foodie/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/ra.jpg'))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Remi',
                        style: TextmajorWhite,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'Nwaniba Uyo',
                                style: TextMinorWhite,
                              ),
                            ],
                          )
                        ],
                      )),
                      SizedBox(height: 10),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '50',
                                    style: TextmajorWhite,
                                  ),
                                  Text(
                                    'Posts',
                                    style: TextMinor,
                                  ),
                                ],
                              ),
                              Text(
                                '|',
                                style: TextStyle(fontSize: 30),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '10k',
                                    style: TextmajorWhite,
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextMinor,
                                  )
                                ],
                              ),
                              Text(
                                '|',
                                style: TextStyle(fontSize: 30),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextmajorWhite,
                                  ),
                                  Text(
                                    'Review',
                                    style: TextMinor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TabBar(
                          indicatorColor: Colors.green,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding: EdgeInsets.only(bottom: 10),
                          tabs: [
                            Text('Posts'),
                            Text('Orders'),
                            Text(' History'),
                            Text('Check')
                          ],
                          controller: _controller,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.47,
                        width: MediaQuery.of(context).size.width * 1,
                        child: TabBarView(controller: _controller, children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.green,
                                    Colors.transparent
                                  ]).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: GridView(
                              padding: EdgeInsets.only(top: 10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.75,
                                      crossAxisCount: 2),
                              children: [
                                PostsItem(
                                  image: AssetImage(
                                      'assets/images/BeefChicken.jpg'),
                                ),
                                PostsItem(
                                  image:
                                      AssetImage('assets/images/afangSoup.jpg'),
                                ),
                                PostsItem(
                                  image: AssetImage('assets/images/burger.jpg'),
                                ),
                                PostsItem(
                                  image:
                                      AssetImage('assets/images/egusiSoup.JPG'),
                                ),
                                PostsItem(
                                  image: AssetImage('assets/images/kebab.jpg'),
                                ),
                                PostsItem(
                                  image:
                                      AssetImage('assets/images/eggsoup.webp'),
                                ),
                                PostsItem(
                                  image:
                                      AssetImage('assets/images/papAkara.jpg'),
                                ),
                                PostsItem(
                                  image:
                                      AssetImage('assets/images/ohaSoup.jpg'),
                                ),
                              ],
                            ),
                          ),
                          ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Text(
                                            'Afang Soup with Eba',
                                            style: TextMinorWhite,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '11:20',
                                        style: TextMinorWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text('History Screen'),
                          Text('Check Screen'),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostsItem extends StatelessWidget {
  ImageProvider image;
  PostsItem({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: image, fit: BoxFit.cover)),
      ),
    );
  }
}
