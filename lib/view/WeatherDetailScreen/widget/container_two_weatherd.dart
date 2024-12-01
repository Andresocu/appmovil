import 'package:flutter/material.dart';
import 'package:aplicacion/models/weather_model.dart';
import 'package:aplicacion/view/WeatherScreen.dart';

class ContainerTwoWeather extends StatefulWidget {
  final WeatherData weatherData;

  ContainerTwoWeather({required this.weatherData});

  @override
  _ContainerTwoWeatherState createState() => _ContainerTwoWeatherState();
}

class _ContainerTwoWeatherState extends State<ContainerTwoWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 2.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo2dt.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This morning: Cloudy',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
