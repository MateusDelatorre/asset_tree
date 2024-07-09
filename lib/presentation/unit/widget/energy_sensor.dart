import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class EnergySensor extends GetView<UnitController> {
  const EnergySensor({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: () {
          controller.energy.value = !controller.energy.value;
          controller.forceUpdate();
        },
        child: Container(
          decoration: BoxDecoration(
            color: controller.energy.value ? const Color(0xff2188FF) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                  children: [
                    Image.asset(
                      color: controller.energy.value ? Colors.white : const Color.fromARGB(255, 142, 152, 163),
                      "assets/simbol-5.png",
                      height: 20,
                    ),
                    Text(
                      "Sensor de Energia",
                      style: TextStyle(
                        color: controller.energy.value ? Colors.white : const Color.fromARGB(255, 142, 152, 163),
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
