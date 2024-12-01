import 'dart:convert';
import 'package:aplicacion/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _url =
      'https://etlagro.agvperu.com/backend_etl/api/operaciones/getregistroestacion?fechainicio=2024-10-10';
  static const String _username = 'n.correa';
  static const String _password = '282702';

  // Función que realiza la petición a la API y mapea los datos
  static Future<List<WeatherData>> fetchWeatherData() async {
    // Codificamos las credenciales en Base64
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$_username:$_password'))}',
    };

    // Usamos MultipartRequest para hacer la petición GET
    var request = http.MultipartRequest('GET', Uri.parse(_url));
    request.headers.addAll(headers);

    // Enviamos la petición y obtenemos la respuesta como stream
    http.StreamedResponse response = await request.send();

    // Procesamos la respuesta
    if (response.statusCode == 200) {
      // Convertimos el stream de la respuesta en un String
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> data = jsonDecode(responseBody);

      // Extraemos los datos de la clave 'response'
      List<dynamic> responseData = data['response'];

      // Mapeamos los datos a una lista de WeatherData
      return responseData.map<WeatherData>((stationData) {
        return WeatherData.fromJson(stationData as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception(
          'Failed to load weather data. Status code: ${response.statusCode}');
    }
  }
}
