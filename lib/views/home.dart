import 'package:flutter/material.dart';
import 'package:weather_app/views/city1.dart';
import 'package:weather_app/views/city2.dart';
import 'package:weather_app/views/city3.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [City(), City2(), City3()],
        ),
      ),
    );
  }
}
