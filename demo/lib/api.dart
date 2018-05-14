import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const key = '';
String token;
class Place {
  final String name;
  final double rating;
  final String address;

  Place.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        rating = jsonMap['rating'].toDouble(),
        address = jsonMap['vicinity'];
}

bool login(String username, String password)  {
  var url = '';
  print('Response status: ${username}');
    print('Response status: ${password}');
  var client = new http.Client();
  var user = { "password": password.toString(), "email": username.toString()};
  
  http.post(url, body: JSON.encode(user),headers: {"Content-Type": "application/json"}).then((response) {
    var data = (response.body);
    print(data);
    token = data;
  });
 // print('Response status: ${response.body}');
  return token == null ? false : true;

}

getProtectedData() async {
  var url = '';
    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    print(response.body);
}
