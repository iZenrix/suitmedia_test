import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/third_screen/controller/third_screen_controller.dart';
import 'package:suitmedia_test/app/modules/third_screen/provider/third_screen_provider.dart';
import 'package:suitmedia_test/app/modules/third_screen/repository/third_screen_repository.dart';

class ThirdScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<ThirdScreenController>(
      () => ThirdScreenController(repository: Get.find<UserRepository>()),
    );
  }
}
