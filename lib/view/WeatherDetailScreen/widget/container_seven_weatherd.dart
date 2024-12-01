import 'package:flutter/material.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/componentes/TemperatureChart.dart';
import 'package:aplicacion/view/WeatherScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ContainerSevenWeather extends StatefulWidget {
  @override
  _ContainerSevenWeatherState createState() => _ContainerSevenWeatherState();
}

class _ContainerSevenWeatherState extends State<ContainerSevenWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header morado con título centrado
        Container(
          width: double.infinity, // Toma todo el ancho
          color: Color.fromRGBO(27, 54, 75, 1), // Color morado
          margin: EdgeInsets.only(top: 2.0),
          padding: EdgeInsets.symmetric(vertical: 10), // Espaciado interno
          child: Center(
            child: Text(
              'WIND',
              style: TextStyle(
                fontSize: 20, // Tamaño de fuente
                fontWeight: FontWeight.bold, // Negrita
                color: Colors.white, // Color del texto
              ),
            ),
          ),
        ),
        // Contenedor con información "Outdoor"
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 251, 254, 1),
            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primer Row con múltiples pares de atributos y valores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherDetailColumn(
                            label: '1.3 M/S', value: '2.7 m/s S'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Aquí es donde agregamos el gráfico de temperatura

        Container(
          width: double.infinity, // Grosor de la línea
          height: 1, // Altura de la línea (ajústalo según necesites)
          color: Colors.black, // Color de la línea
        ),

        SizedBox(height: 20),
        // Contenedor con información "Indoor"
      ],
    );
  }

  Widget _buildWeatherDetailColumn({
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '10 MIN AVG',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(80, 159, 195, 1),
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                    // Cambiar color del texto si es necesario
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'WIND GUST',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(80, 159, 195, 1),
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'LAST 15 MINUTES',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(44, 62, 74, 1),
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
