import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context)=>new  LoginPage(),
    HomePage.tag: (context)=>new  HomePage(), 
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PentaKOP',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      //   //fontFamily: 'Nunito',
        
      // ),
      home: new LoginPage(),
      routes: routes,);
  }
}