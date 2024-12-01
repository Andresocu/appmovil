import 'package:flutter/material.dart';
import 'package:aplicacion/models/weather_model.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_five_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_four_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_nine_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_one_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_seven_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_six_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_three_weatherd.dart';
import 'package:aplicacion/view/WeatherDetailScreen/widget/container_two_weatherd.dart';
import 'package:aplicacion/view/WeatherScreen.dart';

class WeatherDetailScreen extends StatefulWidget {
  final WeatherData weatherData;

  const WeatherDetailScreen({Key? key, required this.weatherData})
      : super(key: key);

  @override
  _WeatherDetailScreenState createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  ScrollController _scrollController = ScrollController();
  String _appBarTitle = 'Weather Details'; // Título inicial
  Color _appBarColor = Color.fromRGBO(27, 54, 75, 1); // Color inicial

  final double containerTwoPosition = 530.0; // Posición estimada de cada header
  final double containerFourPosition = 950.0;
  final double containerfivePosition = 1666.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    print("Current offset: $offset");

    if (offset >= containerFourPosition) {
      setState(() {
        _appBarTitle = 'Temp/Hum';
        _appBarColor = Color.fromRGBO(27, 54, 75, 1);
      });
    } else if (offset >= containerTwoPosition) {
      setState(() {
        _appBarTitle = 'FORECAST';
        _appBarColor = Color.fromRGBO(27, 54, 75, 1);
      });
    } else if (offset >= containerfivePosition) {
      setState(() {
        _appBarTitle = 'RAIN';
        _appBarColor = Color.fromRGBO(27, 54, 75, 1);
      });
    } else {
      setState(() {
        _appBarTitle = 'Weather Details'; // Título original
        _appBarColor = Color.fromRGBO(27, 54, 75, 1);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Ícono de retroceso en blanco
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true, // Centra el título en el AppBar
        title: Text(
          _appBarTitle,
          style: TextStyle(
            color: Colors.white, // Texto del título en blanco
            fontSize: 20,
            fontWeight: FontWeight
                .bold, // Ajusta el tamaño de la fuente si es necesario
          ),
        ),
        backgroundColor: _appBarColor, // Color de fondo del AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,
                color:
                    Colors.white), // Ícono de tres puntos verticales en blanco
            onPressed: () {
              print('Más opciones');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Controlador de desplazamiento
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card 1: Nombre y Ubicación
              ContainerOneWeather(weatherData: widget.weatherData),
              // Card 2: Temperatura Actual
              ContainerTwoWeather(weatherData: widget.weatherData),
              // Card 3: Otros detalles
              ContainerThreeWeather(weatherData: widget.weatherData),
              // Más detalles
              ContainerFourWeather(),
              ContainerFiveWeather(),
              ContainerSixWeather(),
              ContainerSevenWeather(),
              ContainerNineWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
