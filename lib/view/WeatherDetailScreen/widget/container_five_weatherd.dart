import 'package:flutter/material.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/componentes/TemperatureChart.dart';
import 'package:aplicacion/view/WeatherScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ContainerFiveWeather extends StatefulWidget {
  @override
  _ContainerFiveWeatherState createState() => _ContainerFiveWeatherState();
}

class _ContainerFiveWeatherState extends State<ContainerFiveWeather> {
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
              'Temp/Hum',
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
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 251, 254, 1),
            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Color(0xFFD8F0FF), // Color de fondo (#d8f0ff)
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0), // Ajustar el padding según necesites
                child: Text(
                  'Outdoor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Primer Row con múltiples pares de atributos y valores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherDetailColumn(
                            label: 'TEMP', value: '20.9 °c'),
                        SizedBox(height: 10),
                        _buildWeatherDetailColumn(
                            label: 'WET BULB', value: '80.0 %'),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherDetailColumn(
                            label: 'HUMIDITY', value: '20.9 °c'),
                        SizedBox(height: 10),
                        _buildWeatherDetailColumn(
                            label: 'DEW POINT', value: '80.0 %'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 251, 254, 1),
            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Color(0xFFD8F0FF), // Color de fondo (#d8f0ff)
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0), // Ajustar el padding según necesites
                child: Text(
                  'Feels Like',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Primer Row con múltiples pares de atributos y valores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherDetailColumn(
                            label: 'WIND CHILL', value: '21.1 °c'),
                        SizedBox(height: 10),
                        _buildWeatherDetailColumn(
                            label: 'THSW  INDEX', value: '25.0 %'),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherDetailColumn(
                            label: 'HEAD INDEX', value: '21.7 °c'),
                        SizedBox(height: 10),
                        _buildWeatherDetailColumn(label: '', value: ''),
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
          height: 300, // Ajusta la altura
          child: SingleChildScrollView(
            child: TemperatureChart(), // Tu gráfico aquí
          ),
        )
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
                  label,
                  style: TextStyle(
                    fontSize: 13,
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
                    color: Colors.black,
                    // Cambiar color del texto si es necesario
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
