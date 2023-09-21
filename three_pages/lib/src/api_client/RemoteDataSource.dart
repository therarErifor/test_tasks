import 'dart:convert';

import 'package:untitled/src/api_client/api_client.dart';
import 'package:untitled/src/entities/weather_data.dart';

import 'dto.dart';

class RemoteDataSource {
  ApiClient _client = ApiClient();

  Future<WeatherData> getWeatherData() async {
    var response = await _client.getWeather();
    var jsonMap = jsonDecode(response);
    var dto = Dto.fromJson(jsonMap["daily"]);
    return WeatherData(maxTemperature: dto.tmax);
  }
}
