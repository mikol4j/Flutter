import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final mikolaj = new Hero(tag:'hero',
    child: new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new CircleAvatar(
        radius: 72.0,
        backgroundColor: Colors.transparent,
        backgroundImage: new AssetImage('assets/PC_Logo_www.jpg'),
      ),
    ),);
    final welcome = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        'Witaj Mikołaj',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final lorem = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        'Lorem ipsum dolor text, the text...',
        style:new  TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = new Container(
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(28.0),
      decoration: new BoxDecoration(
        gradient: 
        new LinearGradient(colors:[Colors.blue, Colors.lightBlueAccent]),

      ),
      child: new Column(children: <Widget>[
        mikolaj, welcome, lorem
      ],
    ),);
    return new Scaffold(
      body: body,
    );
  }
}