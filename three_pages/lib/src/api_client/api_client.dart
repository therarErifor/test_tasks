import 'dart:convert';
import 'dart:io';

class ApiClient {
  var client = HttpClient();

  getWeather() async {
    try {
      var data;
      const host = "api.open-meteo.com";
      const path =
          "/v1/forecast?latitude=51.5406&longitude=46.0086&daily=temperature_2m_max&timezone=Europe%2FMoscow";

      final request = await client.get(host, 80, path);
      final response = await request.close();
      await for (var contents in response.transform(Utf8Decoder())) {
        data = contents;
      }
      // client.close();
      return data;
    } catch (error) {
      print(error);
    }
  }
}
