import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TemperatureSolarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título del gráfico
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(3, 93, 132, 1), // Color de fondo
          margin: const EdgeInsets.only(top: 0.0),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0), // Desplazamiento desde la izquierda
            child: Text(
              'RAINFALL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Container(
          width: double.infinity,
          color: const Color.fromRGBO(3, 93, 132, 1), // Color de fondo
          margin: const EdgeInsets.only(top: 0.0),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0), // Desplazamiento desde la izquierda
            child: Text(
              'HOURLY & MONTHLY CUMULATIVE',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(0.0),
          /*child: LineChart(
            LineChartData(
              backgroundColor:
                  const Color(0xFF004e75), // Color de fondo del gráfico
              gridData:
                  FlGridData(show: false), // Ocultar las líneas de la grilla
              titlesData: FlTitlesData(
                show: true,
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      switch (value.toInt()) {
                        case 4:
                          return const Text('04:00',
                              style: TextStyle(color: Colors.white));
                        case 5:
                          return const Text('05:00',
                              style: TextStyle(color: Colors.white));
                        case 6:
                          return const Text('06:00',
                              style: TextStyle(color: Colors.white));
                        case 7:
                          return const Text('07:00',
                              style: TextStyle(color: Colors.white));
                        case 8:
                          return const Text('08:00',
                              style: TextStyle(color: Colors.white));
                        case 9:
                          return const Text('09:00',
                              style: TextStyle(color: Colors.white));
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    reservedSize: 30,
                    getTitlesWidget: (value, _) {
                      return Text(
                        '${value.toInt()}°C',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      );
                    },
                  ),
                ),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white, width: 2),
              ),
              minX: 4,
              maxX: 9,
              minY: 18,
              maxY: 32,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(4, 19.0),
                    FlSpot(5, 19.2),
                    FlSpot(6, 19.1),
                    FlSpot(7, 19.4),
                    FlSpot(8, 20.0),
                    FlSpot(9, 21.2),
                  ],
                  isCurved: true,
                  color: Colors.white,
                  barWidth: 4,
                  dotData:
                      FlDotData(show: true), // Mostrar los puntos en el gráfico
                  belowBarData: BarAreaData(
                      show: false), // Desactivar color debajo de la línea
                ),
              ],
            ),
          ),*/
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(Icons.circle, color: Colors.white, size: 10),
              SizedBox(width: 5),
              Text(
                'Hourly Avg',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
