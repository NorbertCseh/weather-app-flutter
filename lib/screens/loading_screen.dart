import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "51faeab3ab6a6d76ab60452e6e1b9efe";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocationt();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper nH = NetworkHelper(
        "api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await nH.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
