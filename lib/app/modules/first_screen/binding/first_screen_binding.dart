import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/first_screen/controller/first_screen_controller.dart';

class FirstScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstScreenController>(
      () => FirstScreenController(),
    );
  }
}