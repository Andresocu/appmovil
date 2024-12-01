class WeatherData {
  final String location;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double windSpeed;
  final String windDirection;
  final double precipitation;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.precipitation,
  });

  // Método para crear una instancia de WeatherData desde un JSON
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['estacion'] ?? 'Unknown Location',
      temperature:
          double.tryParse(json['temperatura_exterior']?.toString() ?? '0') ??
              0.0,
      feelsLike:
          double.tryParse(json['temperatura_alta']?.toString() ?? '0') ?? 0.0,
      humidity: double.tryParse(
              json['humedad_externa_porcentaje']?.toString() ?? '0') ??
          0.0,
      windSpeed:
          double.tryParse(json['velocidad_viento']?.toString() ?? '0') ?? 0.0,
      windDirection: json['direccion_viento'] ?? 'Unknown Direction',
      precipitation: double.tryParse(json['lluvia']?.toString() ?? '0') ?? 0.0,
    );
  }
}
