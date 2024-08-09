import 'package:flutter/material.dart';

AppBar buildAppBar({required String title, required Function()? onPressed}) {
  return AppBar(
    surfaceTintColor: const Color(0xffffffff),
    backgroundColor: const Color(0xffffffff),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.blueAccent,
      ),
      onPressed: onPressed,
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(4.0),
      child: Container(
        color: Colors.grey,
        height: 0.4,
      ),
    ),
  );
}
