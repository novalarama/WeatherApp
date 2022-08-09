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
            print(dataWeather);
            var celcius = dataWeather['temp'] - 273;
            // if (celcius > 30) {
            //   return Container(
            //     color: Colors.amber,
            //   );
            // } else if(celcius <= 30 && celcius >= 16){
            //   return Container(
            //     color: Colors.blue.shade50,
            //   );
            // } else {
            //   return Container(
            //     color: Colors.blue.shade900,
            //   );
            // }

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

// FutureBuilder<Map<dynamic, dynamic>>(
//         future: controller.getDetailWeather(),
//         builder: (context, snapshot) {
//           Map<dynamic, dynamic> weather = snapshot.data!;
//           var celcius = weather['current']['temp'] - 273;
//           return Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios), color: Colors.black),
//                     Text(
//                       "Detail Weather of ${allCityData!['name']}",
//                       style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
//                     ),
//                     Container(),
//                   ],
//                 ),
//                 SizedBox(height: 50),
//                 Center(
//                   child: Text(
//                     '${allCityData!['name']}',
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Center(
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blue,
//                         ),
//                         child: Image.network(
//                           "https://openweathermap.org/img/wn/${weather['current']['weather'][0]['icon']}@2x.png",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ),
//                       Text(
//                         '${weather['current']['weather'][0]['main']}',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//                       ),
//                       SizedBox(height: 100),
//                       Text(
//                         '${weather['current']['temp']}-273',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Center(
//                         child: Column(
//                           children: [
//                             Container(
//                               width: Get.width * 0.3,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(18),
//                                 color: Colors.lightBlue,
//                               ),
//                               child: Image.network(
//                                 "https://openweathermap.org/img/wn/${weather['current']['weather'][0]['icon']}@2x.png",
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${celcius.toInt()}',
//                                   style: TextStyle(fontSize:20, fontWeight: FontWeight.w500, color: Colors.blueGrey),
//                                 ),
//                                 const Text(
//                                   '°',
//                                   style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Colors.blueGrey),
//                                 ),
//                                 Text(
//                                   'C',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.blueGrey),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               '${weather['current']['weather'][0]['main']}',
//                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
//                             ),
//                             Text(
//                               '${weather['current']['weather'][0]['description']}',
//                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),

// Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         decoration: BoxDecoration(
//         color: accentColor, borderRadius: BorderRadius.circular(25)),
//         height: display.height / 3,
//         width: display.width,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25),
//               child: Row(
//                 children: [
//                   Text("Today",
//                       style:
//                           GoogleFonts.rubik(color: Colors.white, fontSize: 30)),
//                   Spacer(),
//                   Text(
//                     widget.weatherData.currentConditions.dayhour,
//                     style: GoogleFonts.rubik(fontSize: 15, color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0, right: 25, left: 25),
//               child: Row(
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                             text: widget.weatherData.currentConditions.temp.c
//                                 .toString(),
//                             style: GoogleFonts.rubik(
//                                 fontSize: 70, color: Colors.white)),
//                         TextSpan(
//                             text: "°C",
//                             style: GoogleFonts.rubik(
//                                 fontSize: 70, color: selectedColor))
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Image.network(
//                     widget.weatherData.currentConditions.iconUrl,
//                     scale: 0.5,
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 15.0, right: 25, left: 25, bottom: 20),
//               child: Row(
//                 children: [
//                   Icon(
//                     const IconData(
//                       0xf193,
//                       fontFamily: 'MaterialIcons',
//                     ),
//                     color: selectedColor,
//                   ),
//                   Expanded(
//                     child: Text(
//                       widget.weatherData.region,
//                       overflow: TextOverflow.ellipsis,
//                       style:
//                           GoogleFonts.rubik(fontSize: 15, color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
