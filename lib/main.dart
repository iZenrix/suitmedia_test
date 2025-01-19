import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/core/theme/app_theme.dart';
import 'package:suitmedia_test/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suitmedia Test',
      theme: AppTheme.theme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
