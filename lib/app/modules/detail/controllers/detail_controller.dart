import 'package:get/get.dart';
import 'package:http/http.dart' as connect;
import 'dart:convert';
import '../../../data/models/weather_model.dart';

class DetailController extends GetxController {
  late final Map<String, dynamic> detailWeather;
  DetailController(this.detailWeather);

  Future<Map<String, dynamic>> getDetailWeather() async {
    // var detailWeatherData = <String, dynamic>{}.obs;

    var lat = detailWeather['latitude'];
    var long = detailWeather['longitude'];

    final resp = await connect.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=43ea6baaad7663dc17637e22ee6f78f2'));
    if (resp.statusCode == 200) {
      final Map result = jsonDecode(resp.body)['current'];
      return result as Map<String, dynamic>;
      // detailWeatherData = json.decode(resp.body);
      // return detailWeatherData;
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
