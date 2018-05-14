import 'package:demo/home_page.dart';
import 'package:flutter/material.dart';
import 'api.dart' as api;

//I used stf prefix to create boilerplate
class LoginPage extends StatefulWidget {
static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myUsernameController = new TextEditingController();
  final myPasswordController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final logo = new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius:48.0,
       child: new  Image.asset('assets/PC_Logo_www.jpg'),
      ),
    );
    final username = new TextFormField(
    controller: myUsernameController,
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'mikolaj.jankwoski@pentacomp.pl',
    decoration: new InputDecoration(
      hintText: 'Email',
      contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: new  OutlineInputBorder(
        borderRadius: new BorderRadius.circular(32.0),
      )
    ),
  );
      final password = new TextFormField(
    controller: myPasswordController,
    autofocus: false,
    initialValue: 'some password',
    obscureText: true,
    decoration: new InputDecoration(
      hintText: 'Password',
     contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(32.0)
      )
    ),
  );

  final loginButton = new Padding(

    padding: new EdgeInsets.symmetric(vertical: 16.0),
    child: new Material(
      borderRadius: new BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      elevation: 5.0,
      child: new MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: (){
          //api.login(username.controller.text,password.controller.text).then(( r) => print(r.body));
         var tmp =  api.login(username.controller.text,password.controller.text);

          //print(res.response);
          if(tmp == true )
          {
            Navigator.of(context).pushNamed(HomePage.tag);
          }
          else
          {
            print('lipa');
          }

        },
        color: Colors.lightBlueAccent,
        child: new Text('Zaloguj', style: new TextStyle(color: Colors.white)),
      ),
    ),
  );
  final forgotLabel = new FlatButton(
    child: new Text('Zapomniałem hasła',
          style: new TextStyle(color: Colors.black45),),
    onPressed: (){} ,
  );
    return new Scaffold(
    backgroundColor: Colors.white,
    body:new  Center(
      child:new  ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          new SizedBox(height: 48.0),
          username,
          new SizedBox(height: 8.0),
          password,
          new SizedBox(height: 24.0),
          loginButton,
          forgotLabel
        ],
      ),
    )
    );
  }
}