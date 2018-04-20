import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:async';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = "https://youtube.com/";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Webview Example',
      theme: new ThemeData.dark(),
      routes: {
        "/": (_) => new Home(),
        "/webview": (_) => new WebviewScaffold(
              url: url,
              appBar: new AppBar(
                title: new Text("Web&Mobile"),
              ),
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
            )
      },

      // home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}


class HomeState extends State<Home> {
  final webView = new FlutterWebviewPlugin();
  TextEditingController controller = new TextEditingController(text: url);

  @override
  void initState() {
    super.initState();

    webView.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
    webView.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:  new AppBar(
          title:  new Text("Web&Mobile"),
        ),
        body:  new Center(
          child:  new Column(
            children: <Widget>[
               new Container(
                padding: new  EdgeInsets.all(10.0),
                child: new  TextField(
                  controller: controller,
                ),
              ),
               new RaisedButton(
                child:  new Text("Otwórz..."),
                onPressed: () {
                  Navigator.of(context).pushNamed("/webview");
                },
              )
            ],
          ),
        )
        );
  }
}
