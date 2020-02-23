import 'package:flutter/material.dart';
import 'package:my_profile/data/user_data.dart';

class FooterBar extends StatefulWidget {
  final double width;
  FooterBar({this.width});

  @override
  State<StatefulWidget> createState() {
    return FooterBarState(width);
  }
}

class FooterBarState extends State<FooterBar> {
  List<Widget> _bootomBar = [];
  final double width;

  FooterBarState(this.width);

  @override
  Widget build(BuildContext context) {
    _bootomBar.clear();
    contactList.forEach((element) {
      _bootomBar.add(
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Theme.of(context).highlightColor,
              child: Icon(
                element.icon,
                size: 25.0,
                color: Colors.white70,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              // width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    element.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    element.content,
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w100),
                    softWrap: true,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });

    return _getContent();
  }

  _getContent() {
    // if(width < 450)
    //   return Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: _bootomBar,
    //     ),
    //   );
    if (width < 750)
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _bootomBar.sublist(0, 2),
              ),
              Row(
                children: _bootomBar.sublist(2, 3),
              ),
            ],
          ),
        ],
      );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _bootomBar,
    );
  }
}
