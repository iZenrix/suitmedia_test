import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
  });

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFE5E5E5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        border: _buildOutlineInputBorder(const Color(0xFFE2E3E4)),
        enabledBorder: _buildOutlineInputBorder(const Color(0xFFE2E3E4)),
        focusedBorder: _buildOutlineInputBorder(const Color(0xFFE2E3E4)),
        hintStyle: TextStyle(
          color: const Color(0xff686777).withOpacity(0.36),
        ),
        focusedErrorBorder: _buildOutlineInputBorder(const Color(0xFFE2E3E4)),
        errorBorder: _buildOutlineInputBorder(const Color(0xFFE2E3E4)),
      ),
    );
  }
}
