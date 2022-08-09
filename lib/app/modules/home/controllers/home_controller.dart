import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../../data/models/cities_model.dart';

class HomeController extends GetxController {
  List<dynamic> dataCity = [].obs;

  Future<dynamic> ReadJson() async {
    var jsonData = await rootBundle.loadString('assets/models/cities.json');
    final list = json.decode(jsonData)['data']['cities'] as List<dynamic>;

    dataCity = list;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ReadJson();
  }
}
