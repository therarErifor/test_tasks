import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/src/api_client/RemoteDataSource.dart';
import 'package:untitled/src/entities/weather_data.dart';

class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  RemoteDataSource dataSource = RemoteDataSource();
  WeatherData? _weatherData;
  int averageTemp = 0;
  String minusPlus = "+";
  String city = "Саратов";

  _ThirdPageState() {
    _initWeatherData();
  }

  void dispose(){
    super.dispose();
    averageTemp = 0;
    _weatherData = null;
  }

  void _initWeatherData() async {
    var response = await dataSource.getWeatherData();
    _weatherData = response;
    if (_weatherData != null) {
      averageTemp = averageData(_weatherData!.maxTemperature);
    }
  }

  int averageData(List<dynamic> data) {
    num sum = 0;
    for (int i = 0; i < data.length; i++) {
      sum = sum + data[i];
    }
    var average = sum / data.length;
    if (average == 0) {
      minusPlus = "";
    } else if (average < 0) {
      minusPlus = "-";
    }
    return average.round();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
        Duration(seconds: 3),
        (Timer t) => setState(() {
              _initWeatherData();
            }));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before_rounded,
            size: 35,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Погода", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/clearSky.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Align(
                  child: Text(city,
                      style: TextStyle(fontSize: 35, color: Colors.white))),
              SizedBox(height: 50),
              Align(
                  child: Text("$minusPlus${averageTemp.toString()}°",
                      style: TextStyle(fontSize: 80, color: Colors.white))),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
