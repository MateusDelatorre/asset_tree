import 'package:asset_tree/presentation/unit/unit_controller.dart';
import 'package:get/get.dart';

class UnitBiding extends Bindings {
  @override
  void dependencies() {
    Get.parameters['unit']!;
    Get.lazyPut(() => UnitController());
  }
}