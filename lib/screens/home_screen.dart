import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/footer_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSmallScreen;

  String _bio =
      '''I am a developer interested in full stack Mobile app development. I love programming as I am a fan of datastructures. Being a fast learner i can adapt to new technologies and work with them on the flow.''';

  Widget _circularWidget(String text, Color color) {
    return Padding(
      padding: _isSmallScreen 
      ? EdgeInsets.all(0.0)
      : EdgeInsets.all(10.0),
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
    _isSmallScreen = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      body: _isSmallScreen
          ? ListView(
              children: _getScreen(),
            )
          : Column(
              children: _getScreen(),
            ),
    );
  }

  _getScreen() {
    return _isSmallScreen
        ? [
            Container(
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getBody(),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            FooterBar(),
          ]
        : [
            Expanded(
              flex: _isSmallScreen ? 6 : 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    _getHeader(),
                    _getBody(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FooterBar(),
            ),
          ];
  }

  _getGreeting() {
    return Column(
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
      ],
    );
  }

  _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: _isSmallScreen ? 3 : 1,
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
              flex: 1,
              child: _isSmallScreen
                  ? IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 40.0,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {},
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            )
          ],
        ),
      ),
    );
  }

  _getBody() {
    Widget image = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              height: _isSmallScreen ? 150.0 : 300.0,
              width: _isSmallScreen ? 150.0 : 300.0,
              image: AssetImage('assets/images/img_01.png'),
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    Widget mainContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getGreeting(),
        Row(
          mainAxisAlignment: _isSmallScreen
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.start,
          children: <Widget>[
            _circularWidget('MY RESUME', Theme.of(context).primaryColor),
            _circularWidget('MY WORK', Theme.of(context).highlightColor),
            _circularWidget('MY SKILLS', Theme.of(context).primaryColorLight),
          ],
        ),
        Text(
          '$_bio',
          style: TextStyle(),
        ),
      ],
    );
    return _isSmallScreen
        ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
              children: <Widget>[
                image,
                mainContent,
              ],
            ),
        )
        : Row(
            children: <Widget>[
              Expanded(
                child: image,
              ),
              Expanded(
                child: mainContent,
              ),
            ],
          );
  }
}
