class WeatherData {
  List<dynamic> maxTemperature;

  WeatherData({required this.maxTemperature});

  factory WeatherData.fromJson(Map<String, dynamic> jsonMap) {
    return WeatherData(maxTemperature: jsonMap["temperature_2m_max"]);
  }
}
