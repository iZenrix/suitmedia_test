import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/global_components/custom_dialog.dart';

class FirstScreenController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  void checkPalindrome() {
    String input = palindromeController.text.replaceAll(' ', '').toLowerCase();
    String reversedInput = input.split('').reversed.join('');
    bool isPalindrome = input == reversedInput;

    if (isPalindrome) {
      buildDialog('Result', 'isPalindrome');
    } else {
      buildDialog('Result', 'notPalindrome');
    }

    palindromeController.clear();
  }
}