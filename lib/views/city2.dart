import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class City2 extends StatefulWidget {
  @override
  _City2State createState() => _City2State();
}

class _City2State extends State<City2> {
  var temp;
  var wind;
  var humidity;
  var pressure;
  var description;
  var weather;
  Future fetchData() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=Arusha&units=metric&appid=96073e3cf9c049281e20c0053956bf1d');
    var result = jsonDecode(response.body);
    print(result);
    setState(() {
      this.temp = result['main']['temp'];
      this.wind = result['wind']['speed'];
      this.humidity = result['main']['humidity'];
      this.pressure = result['main']['pressure'];
      this.description = result['weather'][0]['description'];
      this.weather = result['weather'][0]['main'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(weather == 'Rain'
                        ? 'images/3.jpeg'
                        : weather == 'Clouds'
                            ? 'images/5.jpeg'
                            : weather == 'Sunny'
                                ? 'images/6.jpeg'
                                : weather == 'Fog'
                                    ? 'images/8.jpeg'
                                    : 'images/7.jpeg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temp != null ? temp.toString() + '\u00b0' : 'Loading..',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  description != null ? description.toString() : 'Loading..',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Arusha',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 400, bottom: 30),
            height: 300,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 300,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.black54,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: FaIcon(
                          FontAwesomeIcons.wind,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        wind != null ? wind.toString() + ' km/h' : 'Loading..',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'Wind',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 300,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.black54,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: FaIcon(
                          FontAwesomeIcons.fire,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        humidity != null
                            ? humidity.toString() + ' %'
                            : 'Loading',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'Humidity',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 300,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.black54,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: FaIcon(
                          FontAwesomeIcons.tachometerAlt,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        pressure != null
                            ? pressure.toString() + ' hpa'
                            : 'Loading',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'Air Pressure',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
