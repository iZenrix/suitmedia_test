import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/global_components/custom_app_bar.dart';
import 'package:suitmedia_test/app/modules/third_screen/controller/third_screen_controller.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({super.key});

  static const routeName = '/third-screen';

  @override
  Widget build(BuildContext context) {

    ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!controller.isLoadingMore.value && controller.currentPage.value <= controller.totalPages.value) {
          controller.loadMoreUsers();
        }
      }
    });

    return Scaffold(
      appBar: buildAppBar(
        title: 'Third Screen',
        onPressed: () {
          Get.back(result: controller.selectedName.value);
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.users.isEmpty) {
          return const Center(
            child: Text('No Users Found.'),
          );
        } else {
          return RefreshIndicator(
            onRefresh: controller.refreshUsers,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              controller: scrollController,
              itemCount: controller.users.length + 1,
              itemBuilder: (context, index) {
                if (index == controller.users.length) {
                  if (controller.isLoadingMore.value) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                final user = controller.users[index];
                return GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = user.id;
                    log(controller.selectedIndex.value.toString());
                    controller.selectedName.value =
                    '${user.firstName} ${user.lastName}';

                    Get.closeAllSnackbars();

                    Get.snackbar(
                      'User Selected',
                      '${user.firstName} ${user.lastName}',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blueAccent,
                      colorText: Colors.white,
                      snackStyle: SnackStyle.FLOATING,
                      duration: const Duration(seconds: 1),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                          radius: 40,
                        ),
                        title: Text(
                          '${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff04021D),
                          ),
                        ),
                        subtitle: Text(
                          user.email,
                          style: const TextStyle(
                            color: Color(0xff686777),
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.4,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}



