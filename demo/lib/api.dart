import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:queries/collections.dart';

import 'models/activity.dart';
import 'models/activityKind.dart';
import 'models/activityType.dart';
import 'models/project.dart';
import 'models/user.dart';
import 'models/userTasks.dart';
import 'myGlobals.dart' as global;

const key = '';
String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtaWsiLCJqdGkiOiI1NWRlM2ZlZi05MjNlLTRjMGEtYmNlNi0yNjA3YjI4ZjYwMmUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImNhOTUyY2I3LTdkOTMtNGZjZS04ZjUxLTFiNmMxZmIwMmJiOCIsImV4cCI6MTUzMjE3NTYwMiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDozMjkzMS8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjMyOTMxLyJ9.n6IAct2Ucr3mXz5qUlG5VfMuetTadfyANd8azkGnWJg";
User _user;
List<UserTasks> projects= new List<UserTasks>();



Future<bool> login(String username, String password) async{
  var url = 'http://192.168.127.4/api/account';
  var client = new http.Client();
  //var user = { "password": password.toString(), "username": username.toString()};
  var user = { "password": "Lipiec2017!!", "username": "mik"};

  await http.post(url, body: JSON.encode(user),headers: {"Content-Type": "application/json"}).then((response) {
    if(response.statusCode == 200)
    {
      print('success Response status: ${response.statusCode}');
      var data = (response.body);
      _user = User.fromJson(json.decode(response.body));
      token = _user.token;
      token = data;
      global.MyGlobals.isLogged = true;
      print("testaa");
      return true;
      
    }
    else
    {
            print('fail Response status: ${response.statusCode}');
    }

  });
  return false;

}

Future<List<UserTasks>> getUserProjects() async {
  var url = 'http://192.168.127.4/api/user/usertasks/1625';
    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    
     var responseJson  = json.decode(response.body);
      var projectList  = (responseJson as List).map((p) => UserTasks.fromJson(p)).toList();
      List<UserTasks> _projectsReduced = new List<UserTasks>();


  for (UserTasks p in projectList) {
           if(!(_projectsReduced.any((t)=>t.projectId == p.projectId)))
           {                 
                 _projectsReduced.add(p);
           }
  }
  return _projectsReduced;
}


Future<List<ActivityKind>> getActivityKinds() async {
  var url = 'http://192.168.127.4/api/activity/kinds';
    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    
     var responseJson  = json.decode(response.body);
      var activityKindList  = (responseJson as List).map((p) => ActivityKind.fromJson(p)).toList();
       return activityKindList;
  }
 

Future<List<ActivityType>> getActivityTypes() async {
  var url = 'http://192.168.127.4/api/activity/types';
    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    
     var responseJson  = json.decode(response.body);
      var activityTypeList  = (responseJson as List).map((p) => ActivityType.fromJson(p)).toList();
      print(activityTypeList);
       return activityTypeList;
  }

  Future<List<Activity>> getUserActivities() async {
  var url = 'http://192.168.127.4/api/activity/user/'+1625.toString();
    var response = await http.get(
      url,
      headers: {
        "authorization": "bearer "+token+''
      }
    );
    
     var responseJson  = json.decode(response.body);
      var activityList  = (responseJson as List).map((p) => Activity.fromJson(p)).toList();
      print(activityList.length);
       return activityList;
  }

  Future<void> addActivity(Activity activity) async{
  var url = 'http://192.168.127.4/api/activity';

    //  Activity obj = new Activity();
    //  obj.userId = 1625;
    //  obj.projectId = 3901;
    //  obj.subProjectId = 30166;
    //  obj.activityTypeId = 1;
    //  obj.date = "2018-06-21";
    //  obj.totalTime = 1.0;
    //  obj.comment = "hackaton test 1630";
    //  obj.activityKind = "z";

          Activity obj = new Activity();
    var obj1 = {
     "userId" : 1625,
     "projectId" : 3901,
     "subProjectId" : 30166,
     "activityTypeId" : 1,
     "date" : "2018-06-21",
     "totalTime" : 1.0,
     "comment" : "hackaton test 1630",
     "activityKind" : "z",
    };

  await http.post(url, body: JSON.encode(obj1),
    headers: {"Content-Type": "application/json","authorization": "bearer "+token+''}).then((response) {
    if(response.statusCode == 200)
    {
      print("ok");
    }
    else
    {
            print('fail Response status: ${response.statusCode}');
    }

  });
  return false;

}