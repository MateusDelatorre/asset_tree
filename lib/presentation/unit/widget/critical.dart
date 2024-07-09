import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Critical extends GetView<UnitController> {
  const Critical({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: () {
          controller.critical.value = !controller.critical.value;
          controller.forceUpdate();
        },
        child: Container(
          decoration: BoxDecoration(
            color: controller.critical.value ? const Color(0xff2188FF) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                  children: [
                    Image.asset(
                      color: controller.critical.value ? Colors.white : const Color.fromARGB(255, 142, 152, 163),
                      "assets/simbol-7.png",
                      height: 20,
                    ),
                    Text(
                      "Critical",
                      style: TextStyle(
                        color: controller.critical.value ? Colors.white : const Color.fromARGB(255, 142, 152, 163),
                        fontSize: 16,
                      ),
                    )
                  ]
              ),
            ),
          ),
        )
    )
    );
  }
}
