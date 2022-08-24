import 'package:app_weather/app/data/models/cities_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as connect;
import 'dart:convert';
import 'package:app_weather/app/data/models/weather_model.dart';

class HomeController extends GetxController {
  // prepare variable for save the data city
  final dataCity = <City>[].obs;

  // variable for detail weather of city
  final weatherOfCity = Current().obs;

  @override
  void onInit() {
    super.onInit();
    getDataCity();
  }

  void getDataCity() async {
    var jsonData = await rootBundle.loadString('assets/models/cities.json');
    final list = json.decode(jsonData);

    dataCity.value = Cities.fromJson(list).data!.cities!;
    var lat = dataCity.value.map((e) => e.latitude) as String;
    var long = dataCity.value.map((e) => e.longitude) as String;

    getWeatherOfCity(lat, long);
  }

  void getWeatherOfCity(String lat, String long) async {
    final resp = await connect.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=43ea6baaad7663dc17637e22ee6f78f2'));

    if (resp.statusCode == 200) {
      weatherOfCity.value = jsonDecode(resp.body)['current'];
    } else {
      throw Exception('Failed to Load');
    }
  }
}
