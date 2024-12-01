import 'package:flutter/material.dart';
import 'package:aplicacion/view/WeatherScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'componentes/TemperatureRainChart.dart';

class ContainerSixWeather extends StatefulWidget {
  @override
  _ContainerSixWeatherState createState() => _ContainerSixWeatherState();
}

class _ContainerSixWeatherState extends State<ContainerSixWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Header morado con título centrado
      Container(
        width: double.infinity, // Toma todo el ancho
        color: Color.fromRGBO(27, 54, 75, 1), // Color morado
        margin: EdgeInsets.only(top: 2.0),
        padding: EdgeInsets.symmetric(vertical: 10), // Espaciado interno
        child: Center(
          child: Text(
            'RAIN',
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
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(11, 62, 94, 1),
          borderRadius: BorderRadius.circular(2), // Esquinas redondeadas
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
                          label: 'Current Day', value: '0.0 mm'),
                      _buildWeatherDetailColumn(
                          label: '24 HR', value: '0.0 mm'),
                      _buildWeatherDetailColumn(
                          label: 'Month Total', value: '0.0 mm'),
                      _buildWeatherDetailColumn(
                          label: 'Yearly Rain', value: '0.0 mm'),
                      _buildWeatherDetailColumn(
                          label: 'Current Rate', value: '0.0 mm/hr'),
                      _buildWeatherDetailColumn(
                          label: 'Rain Storm', value: '--'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      Container(
        height: 300, // Ajusta la altura
        child: SingleChildScrollView(
          child: TemperatureRainChart(), // Tu gráfico aquí
        ),
      )
      // Contenedor con información "Indoor"
    ]);
  }

  Widget _buildWeatherDetailColumn(
      {required String label, required String value}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    // Cambiar color del texto si es necesario
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
        Container(
          width: double.infinity, // Grosor de la línea
          height: 1, // Altura de la línea (ajústalo según necesites)
          color: Colors.white, // Color de la línea
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
