import 'package:asset_tree/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff17192d),
        title: Center(
          child: Image.asset(
            "assets/tractian.png",
            height: 30,
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(() =>
            ListView.builder(
              itemCount: controller.companies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed("/${controller.companies[index].id}");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Color(0xff2188FF),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Image.asset(
                              "assets/simbol-1.png",
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${controller.companies[index].name} Unit",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
        ),
      )
    );
  }
}
