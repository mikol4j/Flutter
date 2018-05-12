import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

/// GCP key to access the Places API
const key = 'AIzaSyBRAqMM72Fjz2tfQ5PmQqynkFmdvc_2dk8 ';

class Place {
  final String name;
  final double rating;
  final String address;

  Place.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        rating = jsonMap['rating'].toDouble(),
        address = jsonMap['vicinity'];
}


Future<http.Response> getPlaces(double lat, double lng) {
  return getPlacesFromNetwork();
}

/// Retrieves a stream of places from the Google Places API
Future<http.Response>getPlacesFromNetwork() async {
  var url = 'http://192.168.43.230:57971/api/values';

  var client = new http.Client();
  var httpClient1 = createHttpClient();
  var user = {
  "name": "John Smith",
  "email": "john@example.com"
};
  return httpClient1.post(url, body: JSON.encode(user),headers: {"Content-Type": "application/json"});
  //var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));
  //return streamedRes.stream().toString()
  //return http.get('http://192.168.43.230:57971/values');


}

