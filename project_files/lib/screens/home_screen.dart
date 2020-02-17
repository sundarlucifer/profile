import 'package:flutter/material.dart';
import '../widgets/footer_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _bio =
      '''I am a developer interested in full stack Mobile app development. I love programming as I am a fan of datastructures. Being a fast learner i can adapt to new technologies and work with them on the flow.''';

  Widget _circularWidget(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: 50.0,
        backgroundColor: color,
        child: Text(
          '$text',
          style: TextStyle(fontSize: 10.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      height: 100.0,
                      // color: Colors.grey,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sundar Saravanan',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Full Stack Developer',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.yellow,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'HOME',
                                    style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text('RESUME'),
                                    onTap: () => {},
                                  ),
                                  GestureDetector(
                                    child: Text('CONTACT'),
                                    onTap: () => {},
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image(
                                height: 300.0,
                                width: 300.0,
                                image: AssetImage('assets/images/img_01.png'),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 50.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Text(
                              'a bit about me:',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _circularWidget('MY RESUME',
                                    Theme.of(context).primaryColor),
                                _circularWidget('MY WORK',
                                    Theme.of(context).highlightColor),
                                _circularWidget('MY SKILLS',
                                    Theme.of(context).primaryColorLight),
                              ],
                            ),
                            Text(
                              '$_bio',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FooterBar(),
          )
        ],
      ),
    );
  }
}
