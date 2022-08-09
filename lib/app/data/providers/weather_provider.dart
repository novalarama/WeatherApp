import 'package:get/get.dart';

import '../models/weather_model.dart';

class WeatherProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Weather.fromJson(map);
      if (map is List)
        return map.map((item) => Weather.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Weather?> getWeather(int id) async {
    final response = await get('weather/$id');
    return response.body;
  }

  Future<Response<Weather>> postWeather(Weather weather) async =>
      await post('weather', weather);
  Future<Response> deleteWeather(int id) async => await delete('weather/$id');
}
