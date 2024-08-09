import 'package:flutter/material.dart';
import 'package:get/get.dart';

void buildDialog(String title, String content){
  Get.defaultDialog(
    title: title,
    middleText: content,
    textConfirm: "OK",
    confirmTextColor: const Color(0xffffffff),
    onConfirm: () => Get.back(),
  );
}