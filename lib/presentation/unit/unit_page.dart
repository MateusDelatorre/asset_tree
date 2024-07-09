import 'package:asset_tree/domain/entities/location.dart';
import 'package:asset_tree/presentation/unit/asset_tile.dart';
import 'package:asset_tree/presentation/unit/location_tile.dart';
import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:asset_tree/presentation/unit/widget/critical.dart';
import 'package:asset_tree/presentation/unit/widget/energy_sensor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitPage extends GetView<UnitController>  {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff17192d),
        title: const Text(
          "Unit Assets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: controller.searchController,
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Pesquisar",
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 142, 152, 163)
                              ),
                              suffixIcon: Icon(Icons.search, color: Color.fromRGBO(33, 136, 255, 1)),
                              contentPadding: EdgeInsets.only(left: 20, right: 16),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide:
                                BorderSide(width: 1.25, color: Color.fromARGB(255, 142, 152, 163)),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide:
                                BorderSide(width: 1.25, color: Color.fromRGBO(33, 136, 255, 1)),
                              )
                          ),
                          onChanged: (value) {
                            controller.forceUpdate();
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2.0, left: 16),
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            children: [
                              EnergySensor(),
                              Critical(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() => Column(
                  children: [
                    for (var location in controller.locations)
                      LocationTile(
                        location: location,
                        initiallyExpanded: controller.locations.length < 10,
                      ),
                    for (var asset in controller.assets)
                      AssetTile(
                        asset: asset,
                        initiallyExpanded: controller.assets.length < 10,
                      )
                  ],
                ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
