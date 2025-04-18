import 'package:flutter/material.dart';

class MyTextFeid extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;

  const MyTextFeid(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(50.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(50.0),
        ),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
