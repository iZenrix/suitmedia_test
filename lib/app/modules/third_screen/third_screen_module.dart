import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/third_screen/binding/third_screen_binding.dart';
import 'view/third_screen_view.dart';

class ThirdScreenModule{
  static GetPage route(){
    return GetPage(
      name: ThirdScreenView.routeName,
      page: () => const ThirdScreenView(),
      binding: ThirdScreenBinding(),
    );
  }
}