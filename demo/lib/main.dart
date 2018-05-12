import 'package:flutter/material.dart';
import 'dart:async';
import 'api.dart' as api;


void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  _State createState() => new _State();
}

class _State extends State<MyApp>{
    DateTime selectedDate = new DateTime.now();
    /// Retrieves a list of restaurants from Google's Places REST API
  _getPlaces() {
    final stream =  api.getPlacesFromNetwork();
    print(stream.toString());
    //stream.toString();
  }

  @override
  initState() {
    super.initState();
    _getPlaces();
  }
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
      appBar: new AppBar(title: new Text('RCP1')),
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
                  //onPressed: (){_selectDate(context);}
                  onPressed: (){_getPlaces();}
                ),
                new Text(''),
                new Text('Komentarz'),
                new TextField()
              ],           
          ),
          
        ),
        bottomNavigationBar: 
                        new FloatingActionButton(
                  child: new Text('+'),
                  onPressed: null
                ),
      ));
   }
}