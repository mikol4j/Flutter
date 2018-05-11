import 'package:flutter/material.dart';
import 'dart:async';



void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  _State createState() => new _State();
}

class _State extends State<MyApp>{
    DateTime selectedDate = new DateTime.now();

   Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime(2015, 8),
      lastDate: new DateTime(2101)
    );
   
    if (picked != null && picked != selectedDate)
    {
      setState((){
        selectedDate = picked;
        });
    }
   }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('RCP')),
      body: new Scaffold(
        appBar: new AppBar(
          title: new Text('Nowa czynność'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
          children: <Widget>[
          new Text('Date selected: ${selectedDate.toString()}'),
          new RaisedButton(
                  child: new Text('Select Date'),
                  onPressed: (){_selectDate(context);}
                ),
                new Text(''),
                new Text('Komentarz'),
                new TextField(),
                new RaisedButton(
                  child: new Text('Dodaj'),
                  onPressed: selectedDate.month == 5 ? null : (){},
                )
              ],           
          ),
        ),
      ));
   }
}