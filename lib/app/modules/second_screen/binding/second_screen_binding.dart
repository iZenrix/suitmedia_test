import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/second_screen/controller/second_screen_controller.dart';

class SecondScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondScreenController>(() => SecondScreenController());
  }
}