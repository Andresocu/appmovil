import 'package:flutter/material.dart';

class ContainerFourWeather extends StatefulWidget {
  @override
  _ContainerFourWeatherState createState() => _ContainerFourWeatherState();
}

class _ContainerFourWeatherState extends State<ContainerFourWeather>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
              'FORECAST',
              style: TextStyle(
                fontSize: 20, // Tamaño de fuente
                fontWeight: FontWeight.bold, // Negrita
                color: Colors.white, // Color del texto
              ),
            ),
          ),
        ),

        // TabBar Widget
        Container(
          color: Color.fromRGBO(21, 90, 131, 1),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xffffffff),
            labelColor: Color(0xffffffff),
            unselectedLabelColor: Color(0xffffffff),
            tabs: [
              Tab(text: '7-Day'),
              Tab(text: 'Hourly'),
            ],
          ),
        ),

        // TabBarView Widget (dentro de un Container con altura)
        Container(
          height: 400, // Ajusta esta altura según lo que desees
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSevenDayView(),
              _buildHourlyView(),
            ],
          ),
        ),
      ],
    );
  }

  // Contenido de la vista de 7 días
  Widget _buildSevenDayView() {
    return Row(
      children: [
        // Primera columna fija
        Container(
          width: 100,
          // Ajusta el ancho de la columna fija
          color: Color.fromRGBO(10, 77, 112, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildWeatherDetailColumn(
                label: '',
              ),
              _buildWeatherDetailColumn(
                label: 'High Temp',
              ),
              _buildWeatherDetailColumn(
                label: 'Low Temp',
              ),
              _buildWeatherDetailColumn(
                label: 'Cloud Coverage',
              ),
              _buildWeatherDetailColumn(
                label: '24 Hr Accum.',
              ),
              _buildWeatherDetailColumn(
                label: 'Chance of Rainfall',
              ),
            ],
          ),
        ),
        // Scroll horizontal para las otras columnas (7 días de la semana)
        Container(
          width: 1, // Grosor de la línea
          height: 150, // Altura de la línea (ajústalo según necesites)
          color: Colors.white, // Color de la línea
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(7, (index) {
                String dayName =
                    ''; // Aquí definimos el nombre del día (Saturday, Sunday, etc.)
                IconData? dayIcon; // Aquí definimos el icono para algunos días
                String tempText = '';
                String lowText = '';
                String hraccumText = '';
                String chanceoftext = '';
                // Determinamos el día y asignamos el icono y el texto correspondiente
                switch (index) {
                  case 0:
                    dayName = 'Saturday';
                    tempText = '28.9°';
                    lowText = '15.0°';
                    hraccumText = '00 mm';
                    chanceoftext = '2%';
                    dayIcon = Icons.wb_sunny; // Ejemplo: Sol para el sábado
                    break;
                  case 1:
                    dayName = 'Sunday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '2%';
                    dayIcon = Icons.cloud; // Ejemplo: Nube para el domingo
                    break;
                  case 2:
                    dayName = 'Monday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '5%';

                    break;
                  case 3:
                    dayName = 'Tuesday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '5%';
                    break;
                  case 4:
                    dayName = 'Wednesday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '5%';
                    break;
                  case 5:
                    dayName = 'Thursday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '5%';
                    break;
                  case 6:
                    dayName = 'Friday';
                    tempText = '30.6°';
                    lowText = '14.4°';
                    hraccumText = '00 mm';
                    chanceoftext = '5%';
                    break;
                }

                return Container(
                    width: 120, // Ajusta el ancho de cada columna de día

                    color: Color.fromRGBO(39, 97, 130, 1),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Centrar en la columna
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // Ajustar la altura al contenido
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          ), // Ajustar el padding entre los elementos
                          child: Text(
                            dayName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                            textAlign: TextAlign
                                .center, // Centrar el texto horizontalmente
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            tempText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .white, // Cambiar color del texto si es necesario
                            ),
                            textAlign: TextAlign
                                .center, // Centrar el texto horizontalmente
                            softWrap:
                                true, // Permitir que el texto se ajuste en varias líneas
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            lowText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .white, // Cambiar color del texto si es necesario
                            ),
                            textAlign: TextAlign
                                .center, // Centrar el texto horizontalmente
                            softWrap:
                                true, // Permitir que el texto se ajuste en varias líneas
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        if (dayIcon != null) // Si existe un ícono, lo mostramos
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Icon(
                              dayIcon,
                              size: 50,
                              color: Color(0xffffffff),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Text(
                            hraccumText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .white, // Cambiar color del texto si es necesario
                            ),
                            textAlign: TextAlign
                                .center, // Centrar el texto horizontalmente
                            softWrap:
                                true, // Permitir que el texto se ajuste en varias líneas
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            chanceoftext,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .white, // Cambiar color del texto si es necesario
                            ),
                            textAlign: TextAlign
                                .center, // Centrar el texto horizontalmente
                            softWrap:
                                true, // Permitir que el texto se ajuste en varias líneas
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ));
              }),
            ),
          ),
        )
      ],
    );
  }

  // Contenido de la vista por hora
  Widget _buildHourlyView() {
    return Center(child: Text('Hourly Forecast View'));
  }

  Widget _buildWeatherDetailColumn({required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centrar en la columna
      crossAxisAlignment: CrossAxisAlignment.center, // Centrar horizontalmente
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0), // Ajustar el padding entre los elementos
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // Cambiar color del texto si es necesario
            ),
            textAlign: TextAlign.center, // Centrar el texto horizontalmente
            softWrap: true, // Permitir que el texto se ajuste en varias líneas
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
