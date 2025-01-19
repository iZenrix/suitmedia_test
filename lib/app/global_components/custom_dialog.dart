import 'package:get/get.dart';
import 'package:suitmedia_test/app/core/theme/app_colors.dart';

void buildDialog(String title, String content){
  Get.defaultDialog(
    title: title,
    middleText: content,
    textConfirm: "OK",
    confirmTextColor: AppColors.pureWhite,
    onConfirm: () => Get.back(),
  );
}