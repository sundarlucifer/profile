import 'package:flutter/material.dart';
import 'package:my_profile/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sundar Saravanan',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(215, 70, 89, 1.0),
        highlightColor: Color.fromRGBO(125, 205, 210, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(234, 229, 229, 1.0),
        accentColor: Color.fromRGBO(96, 96, 96, 1.0),
        primaryColorLight: Color.fromRGBO(210, 200, 75, 1.0),
      ),
    );
  }
}