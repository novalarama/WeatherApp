import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_weather/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:app_weather/app/data/constants/constants.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'Weather App',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(
        () => ListView.builder(
          itemCount: controller.dataCity.length,
          itemBuilder: (context, index) {
            if (index < controller.dataCity.length) {
              var cities = controller.dataCity;
              var celcius = controller.weatherOfCity.value.temp! - 273;
              return Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL,
                      arguments: cities[index],
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cities[index].name ?? "Not Found",
                            style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                          ),
                          Text(
                            "${celcius}•C",
                            style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
