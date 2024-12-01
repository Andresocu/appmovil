import 'package:flutter/material.dart';
import 'package:aplicacion/models/weather_model.dart';
import 'package:aplicacion/view/WeatherScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ContainerThreeWeather extends StatefulWidget {
  final WeatherData weatherData;

  ContainerThreeWeather({required this.weatherData});

  @override
  _ContainerThreeWeatherState createState() => _ContainerThreeWeatherState();
}

class _ContainerThreeWeatherState extends State<ContainerThreeWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo3dt.png'),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWeatherDetailColumn(
                    icon: EvaIcons.dropletOutline,
                    label: '24hr',
                    value: '0.0 mm'),
                SizedBox(height: 10),
                _buildWeatherDetailColumn(
                    icon: LucideIcons.cloudRain,
                    label: 'Hum',
                    value: '${widget.weatherData.humidity}%'),
              ],
            ),
          ),
          Container(
            width: 1, // Grosor de la línea
            height: 150, // Altura de la línea (ajústalo según necesites)
            color: Colors.white, // Color de la línea
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWeatherDetailColumn(
                    icon: LucideIcons.arrowBigRight,
                    label: 'Pressure',
                    value: '1008.3 mb'),
                SizedBox(height: 10),
                _buildWeatherDetailColumn(
                    icon: Icons.air,
                    label: '${widget.weatherData.windDirection}',
                    value: '${widget.weatherData.windSpeed} m/s'),
                SizedBox(height: 10),
                _buildWeatherDetailColumn(
                    icon: LucideIcons.sun, label: 'Solar', value: '338 W/m²'),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 1, // Grosor de la línea
            height: 150, // Altura de la línea (ajústalo según necesites)
            color: Colors.white, // Color de la línea
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWeatherDetailColumn(
                    icon: LucideIcons.sunrise,
                    label: 'Sunrise',
                    value: '05:54'),
                SizedBox(height: 10),
                _buildWeatherDetailColumn(
                    icon: LucideIcons.sunset, label: 'Sunset', value: '18:14'),
                SizedBox(height: 10),
                _buildWeatherDetailColumn(
                    icon: LucideIcons.sunDim, label: 'UV', value: '2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetailColumn(
      {required IconData icon, required String label, required String value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        Colors.white, // Cambiar color del texto si es necesario
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
