import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/third_screen/third_screen_controller.dart';
import 'package:suitmedia_test/app/modules/third_screen/third_screen_repository.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThirdScreenController(repository: UserRepository()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 0.4,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = user.id;
                  log(controller.selectedIndex.value.toString());
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                    ),
                    const Divider(
                      thickness: 0.4,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
