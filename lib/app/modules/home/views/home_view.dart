import 'package:flutter/material.dart';
import 'package:app_weather/app/modules/detail/controllers/detail_controller.dart';
import 'package:get/get.dart';
import 'package:app_weather/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<HomeController>(builder: (value) {
          return Obx(
            () => ListView.builder(
              itemCount: controller.dataCity.length,
              itemBuilder: (context, index) {
                var cities = controller.dataCity;
                return Padding(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL,
                        arguments: cities[index],
                      );
                      print(cities);

                      final controller = Get.lazyPut<DetailController>(
                        () => DetailController(cities[index]),
                      );
                      Get.find<DetailController>();
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cities[index]['name'],
                              style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class DetailsController {}
