import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/second_screen/second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SecondScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
