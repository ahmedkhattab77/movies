import 'package:flutter/material.dart';

typedef OnChanged = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      required this.hintText,
      required this.controller,
      this.onChanged,
      Key? key})
      : super(key: key);
  String hintText;
  TextEditingController? controller;
  OnChanged? onChanged;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }
}
