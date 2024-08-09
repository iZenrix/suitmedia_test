import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/first_screen/binding/first_screen_binding.dart';
import 'package:suitmedia_test/app/modules/first_screen/view/first_screen_view.dart';

class FirstScreenModule{
  static GetPage route(){
    return GetPage(
      name: FirstScreenView.routeName,
      page: () => const FirstScreenView(),
      binding: FirstScreenBinding(),
    );
  }
}