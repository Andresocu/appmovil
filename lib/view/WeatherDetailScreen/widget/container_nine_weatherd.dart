import 'package:flutter/material.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/componentes/TemperatureSolarChart.dart';

import 'componentes/TemperatureRainChart.dart';

class ContainerNineWeather extends StatefulWidget {
  @override
  _ContainerNineWeatherState createState() => _ContainerNineWeatherState();
}

class _ContainerNineWeatherState extends State<ContainerNineWeather> {
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
            'Solar Radiation',
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
                          label: 'Evapotranspiration', value: '0.23 mm'),
                      _buildWeatherDetailColumn(
                          label: 'Hi Solar Rad', value: '383 W/m² @ 09:15'),
                      _buildWeatherDetailColumn(
                          label: 'Past 24 HR', value: '6 kWh/m²'),
                      _buildWeatherDetailColumn(
                          label: 'Current', value: '338 W/m²'),
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
          child: TemperatureSolarChart(), // Tu gráfico aquí
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
