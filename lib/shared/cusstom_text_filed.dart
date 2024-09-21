import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({
    super.key,
    required this.hinttext,
    required this.isPassword,
    this.textInputType = TextInputType.text,
  });
  final bool isPassword;
  final TextInputType textInputType;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        hintText: hinttext,
        filled: true,
      ),
    );
  }
}
