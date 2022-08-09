import 'package:get/get.dart';

import '../models/cities_model.dart';

class CitiesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Cities.fromJson(map);
      if (map is List) return map.map((item) => Cities.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Cities?> getCities(int id) async {
    final response = await get('cities/$id');
    return response.body;
  }

  Future<Response<Cities>> postCities(Cities cities) async =>
      await post('cities', cities);
  Future<Response> deleteCities(int id) async => await delete('cities/$id');
}
