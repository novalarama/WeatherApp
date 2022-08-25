import 'package:app_weather/app/data/models/cities_model.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as connect;
import 'dart:convert';

class DetailController extends GetxController {
  final City? city = Get.arguments;

  Future<Map<String, dynamic>> getDetailWeather() async {
    var lat = city!.latitude;
    var long = city!.longitude;

    final resp = await connect.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=43ea6baaad7663dc17637e22ee6f78f2'));
    if (resp.statusCode == 200) {
      final weatherOfCity = jsonDecode(resp.body)['current'];
      return weatherOfCity as Map<String, dynamic>;
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDetailWeather();
  }
}
