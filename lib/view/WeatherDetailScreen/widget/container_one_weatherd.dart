import 'package:flutter/material.dart';
import 'package:aplicacion/models/weather_model.dart';
import 'package:aplicacion/view/WeatherScreen.dart';

class ContainerOneWeather extends StatefulWidget {
  final WeatherData weatherData;

  ContainerOneWeather({required this.weatherData});

  @override
  _ContainerOneWeatherState createState() => _ContainerOneWeatherState();
}

class _ContainerOneWeatherState extends State<ContainerOneWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 2.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo1dt.png'),
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
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.weatherData.location}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${widget.weatherData.location}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${widget.weatherData.temperature}°C',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Feels Like ${widget.weatherData.feelsLike}°C',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today Hi/Lo Temp',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Hi: 21.0 °C @ 09:30',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Lo: 18.0 °C @ 06:15',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // Aquí puedes agregar la lógica para guardar
                print('Guardar favorito');
              },
            ),
          ),
        ],
      ),
    );
  }
}
