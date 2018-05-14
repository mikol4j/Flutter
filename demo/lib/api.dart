import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

/// GCP key to access the Places API
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



/// Retrieves a stream of places from the Google Places API
bool login(String username, String password)  {
  var url = '';
  print('Response status: ${username}');
    print('Response status: ${password}');
  var client = new http.Client();
  var httpClient1 = createHttpClient();
  var user = {
  "password": password.toString(),
  "email": username.toString(),
};
  http.post(url, body: JSON.encode(user),headers: {"Content-Type": "application/json"}).then((response) {
    var data = (response.body);
    print('holl');
    print(data);
    token = data;
  });
 // print('Response status: ${response.body}');
  //token = response.body;
  return token == null ? false : true;


  //var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));
  //return streamedRes.stream().toString()
  //return http.get('http://192.168.43.230:57971/values');


}

/// Retrieves a stream of places from the Google Places API
getProtectedData() async {
  var url = '';

  // var response =   await http.get(url,
  // print('Response status: ${response.statusCode}');
  // return response;


    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    print(response.body);
}
