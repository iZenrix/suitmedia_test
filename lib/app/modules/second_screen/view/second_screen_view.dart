import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/global_components/custom_app_bar.dart';
import 'package:suitmedia_test/app/global_components/custom_button.dart';
import 'package:suitmedia_test/app/modules/second_screen/controller/second_screen_controller.dart';
import 'package:suitmedia_test/app/modules/third_screen/view/third_screen_view.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({super.key});

  static const routeName = '/second-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Second Screen',
        onPressed: () {
          Get.back();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff04021D),
                  ),
                ),
                Obx(
                  () => Text(
                    controller.userName.value,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff04021D),
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.center,
              child: Text(
                controller.selectedName.value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff04021D),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: CustomButton(
                text: 'Choose a User',
                onPressed: () async {
                  var result = await Get.toNamed(ThirdScreenView.routeName);
                  if (result != null) {
                    controller.selectedName.value = result;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
