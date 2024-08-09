import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/global_components/custom_button.dart';
import 'package:suitmedia_test/app/global_components/custom_dialog.dart';
import 'package:suitmedia_test/app/modules/first_screen/controller/first_screen_controller.dart';
import 'package:suitmedia_test/app/modules/first_screen/widgets/custom_text_field.dart';
import 'package:suitmedia_test/app/modules/second_screen/view/second_screen_view.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  const FirstScreenView({super.key});

  static const String routeName = '/first-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //add background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profile-icon.png',
                  width: 116,
                  height: 116,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: 'Name',
                        controller: controller.nameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CustomTextFormField(
                        hintText: 'Palindrome',
                        controller: controller.palindromeController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomButton(
                  text: 'CHECK',
                  onPressed: () {
                    if (controller.palindromeController.text.isEmpty) {
                      buildDialog(
                        'Warning',
                        'Please fill the palindrome field',
                      );
                    } else {
                      controller.checkPalindrome();
                    }
                  },
                ),
                CustomButton(
                  text: 'NEXT',
                  onPressed: () => Get.toNamed(
                    SecondScreenView.routeName,
                    arguments: controller.nameController.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
