import 'package:flutter/material.dart';
import 'package:my_profile/data/contact.dart';

class FooterBar extends StatefulWidget{



}


class FooterBarState extends State<FooterBar> {
  List<Widget> _bootomBar = [];

  @override
  void init(){
    
    contactList.forEach((element) {
      _bootomBar.add(
        CircleAvatar(
          backgroundColor: Theme.of(context).highlightColor,
          child: Icon(
            element.icon,
            color: Colors.white70,
          ),
        ),
      );
      _bootomBar.add(
        SizedBox(
          width: 10.0,
        ),
      );
      _bootomBar.add(
        Container(
          width: 170.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                element.title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                element.content,
                style:
                    TextStyle(color: Colors.white70, fontWeight: FontWeight.w100),
                softWrap: true,
              )
            ],
          ),
        ),
      );
      _bootomBar.add(SizedBox(
        width: 20.0,
      ));
    });

    super.initstate();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _bootomBar,
      ),
    );
  }
}
