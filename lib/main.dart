import 'package:asset_tree/presentation/bidings/unit_biding.dart';
import 'package:asset_tree/presentation/home/home_controller.dart';
import 'package:asset_tree/presentation/home/home_page.dart';
import 'package:asset_tree/presentation/unit/unit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(
            binding: UnitBiding(),
            name: '/:unit', page: (){
            return const UnitPage();
          }),
        ],
      ));
}