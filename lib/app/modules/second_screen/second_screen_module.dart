import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/second_screen/binding/second_screen_binding.dart';
import 'package:suitmedia_test/app/modules/second_screen/view/second_screen_view.dart';

class SecondScreenModule{
  static GetPage route(){
    return GetPage(
      name: SecondScreenView.routeName,
      page: () => const SecondScreenView(),
      binding: SecondScreenBinding(),
    );
  }
}