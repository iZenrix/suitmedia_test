import 'package:suitmedia_test/app/modules/first_screen/first_screen_module.dart';
import 'package:suitmedia_test/app/modules/first_screen/view/first_screen_view.dart';
import 'package:suitmedia_test/app/modules/second_screen/second_screen_module.dart';
import 'package:suitmedia_test/app/modules/third_screen/third_screen_module.dart';

class AppPages{
  AppPages._();

  static const INITIAL = FirstScreenView.routeName;

  static final routes = [
    FirstScreenModule.route(),
    SecondScreenModule.route(),
    ThirdScreenModule.route(),
  ];
}