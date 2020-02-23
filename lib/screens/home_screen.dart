import 'package:flutter/material.dart';
import 'package:my_profile/data/user_data.dart';
import '../widgets/footer_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSmallScreen;
  var width, height;

  @override
  Widget build(BuildContext context) {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
    _isSmallScreen = width < 720 || height < 600;
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
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: 200.0,
              child: FooterBar(width: width),
            ),
          ]
        : [
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _getHeader(),
                    _getBody(),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: 100,
              child: FooterBar(width: width,),
            ),
          ];
  }

  _getHeader() {
    final Widget nameBanner = Column(
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
    );

    final Widget navBar = _isSmallScreen
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
          );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: _isSmallScreen ? 3 : 1,
              child: nameBanner,
            ),
            Expanded(
              child: navBar,
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
            height: 300.0,
            width: 300.0,
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
            _circularWidget(
              'MY RESUME',
              Theme.of(context).primaryColor,
            ),
            _circularWidget(
              'MY WORK',
              Theme.of(context).highlightColor,
            ),
            _circularWidget(
              'MY SKILLS',
              Theme.of(context).primaryColorLight,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          width: _isSmallScreen ? MediaQuery.of(context).size.width : 450.0,
          child: Text(
            bio,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
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

  Widget _circularWidget(String text, Color color) {
    return Padding(
      padding: _isSmallScreen ? EdgeInsets.all(0.0) : EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: _isSmallScreen ? MediaQuery.of(context).size.width / 8 : 50.0,
        backgroundColor: color,
        child: Text(
          '$text',
          style: TextStyle(fontSize: 10.0, color: Colors.white),
        ),
      ),
    );
  }
}
