import 'package:flutter/material.dart';
import 'package:weather_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// api.openweathermap.org/data/2.5/weather?q=Dar es salaam&appid=96073e3cf9c049281e20c0053956bf1d
