import 'package:app_weather/app/data/models/weather_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/constants.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  Map<dynamic, dynamic>? allCityData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    if (allCityData != null) {
      return Scaffold(
          body: FutureBuilder<Map<String, dynamic>>(
        future: controller.getDetailWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            Map<dynamic, dynamic> dataWeather = Map.from(snapshot.data!);
            var celcius = dataWeather['temp'] - 273;

            return Center(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded))],
                    ),
                    SizedBox(height: 100),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.network("https://openweathermap.org/img/wn/${dataWeather['weather'][0]['icon']}@2x.png"),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                Text(
                                  "${celcius.toInt()}°C",
                                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          Text(
                            '${allCityData!['name']}',
                            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${dataWeather['weather'][0]['main']} - ${dataWeather['weather'][0]['description']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                          ),
                          SizedBox(height: 50),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.sunny, size: 40, color: Colors.blueGrey.shade900,),
                                          SizedBox(height: 10),
                                          Text(
                                            '${dataWeather['uvi']}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.cloud, size: 40, color: Colors.blueGrey.shade900,),
                                          SizedBox(height: 10),
                                          Text(
                                            '${dataWeather['clouds']}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  Text('Sorry Data Has not been Found'),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: null,
                  ),
                ],
              ),
            );
          }
        },
      ));
    } else {
      return Scaffold(
        body: Center(
          child: Text('Sorry, There is a Problem'),
        ),
      );
    }
  }
}
