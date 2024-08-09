import 'package:get/get.dart';

class SecondScreenController extends GetxController {

  RxString selectedName = 'Selected User Name'.obs;
  RxString userName = 'User Name'.obs;

  @override
  void onInit() {
    var arguments = Get.arguments;
    if (arguments is String && arguments.isNotEmpty) {
      userName.value = arguments;
    }
    super.onInit();
  }
}