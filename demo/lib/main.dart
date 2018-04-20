import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HellloWidget(title:"hello world");
  }
}

class HellloWidget extends StatelessWidget {
  final String title;
  HellloWidget({this.title});
  @override
  Widget build(BuildContext ctx) {
    return new Center(child:
    new MaterialApp(
      title: 'Welcome to Flutter...',
      home: new Scaffold(
        appBar: new AppBar(
          title:  new Center(child: new Text('PentaKOP', style:new TextStyle(fontSize: 24.0))),
        ),
        body: new Center(
          child: new Text(this.title),
        ),
      ),
    ));
  }
}
