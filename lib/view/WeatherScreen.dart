import 'package:aplicacion/models/weather_model.dart';
import 'package:aplicacion/services/weather_service.dart';
import 'package:aplicacion/view/WeatherDetailScreen/WeatherDetailScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

 // Importar tu modelo

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<List<WeatherData>> _weatherDataFuture;

  @override
  void initState() {
    super.initState();
    // Llamar a la API para obtener los datos del clima
    _weatherDataFuture = WeatherService.fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla meteorológica'),
      ),
      body: FutureBuilder<List<WeatherData>>(
        future: _weatherDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error al cargar los datos ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
          } else {
            final weatherData = snapshot.data!;
            return ListView.builder(
              itemCount: weatherData.length,
              itemBuilder: (context, index) {
                final data = weatherData[index];
                return GestureDetector(
                  onTap: () {
                    // Navegar a la nueva pantalla con los datos
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WeatherDetailScreen(weatherData: data),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/fondotiempo.png'),
                        fit: BoxFit
                            .cover, // Ajusta la imagen al tamaño del Container
                      ),
                      borderRadius:
                          BorderRadius.circular(15.0), // Bordes redondeados
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left:
                                      20.0), // Ajusta este valor según lo necesites
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.location,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    data.location,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.cloud, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      '${data.temperature}°C',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildWeatherDetailColumn(
                                  icon: LucideIcons.cloudRain,
                                  label: '24hr',
                                  value: '${data.precipitation} mm'),
                              _buildWeatherDetailColumn(
                                  icon: Icons.thermostat,
                                  label: 'Feels',
                                  value: '${data.feelsLike}°C'),
                              _buildWeatherDetailColumn(
                                  icon: Icons.air,
                                  label: '${data.windDirection}',
                                  value: '${data.windSpeed} m/s'),
                              _buildWeatherDetailColumn(
                                  icon: EvaIcons.dropletOutline,
                                  label: 'Hum',
                                  value: '${data.humidity}%'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildWeatherDetailColumn({
    required IconData icon,
    required String label,
    required String value,
  }) {
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
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
