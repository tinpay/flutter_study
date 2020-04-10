import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData(latitude: 37.33020182, longitude: -122.02497163);
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
  }

  void getData({double latitude, double longitude}) async {
    NetworkHelper helper = NetworkHelper(
        "https://samples.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=b6907d289e10d714a6e88b30761fae22");
    Map<String, dynamic> result = await helper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
//            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
