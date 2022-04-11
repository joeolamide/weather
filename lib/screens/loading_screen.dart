import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtitude);
    getLocation();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat={135}&lon={49}&appid={80cf785fcac2bf3d6c4cf5d1c69fd539}'));
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
