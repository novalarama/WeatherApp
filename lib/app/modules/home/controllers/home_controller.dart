import 'package:app_weather/app/data/models/cities_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HomeController extends GetxController {
  final dataCity = <City>[].obs;

  Future<void> ReadJson() async {
    var jsonData = await rootBundle.loadString('assets/models/cities.json');
    final list = json.decode(jsonData);

    dataCity.value = Cities.fromJson(list).data!.cities!;

    // update();
  }

  @override
  void onInit() {
    super.onInit();
    ReadJson();
  }
}
