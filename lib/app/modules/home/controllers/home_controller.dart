import 'package:app_weather/app/data/models/cities_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HomeController extends GetxController {
  // prepare variable for save the data city
  final dataCity = <City>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataCity();
  }

  
  void getDataCity() async {
    var jsonData = await rootBundle.loadString('assets/models/cities.json');
    final list = json.decode(jsonData);

    dataCity.value = Cities.fromJson(list).data!.cities!;
  }
}
