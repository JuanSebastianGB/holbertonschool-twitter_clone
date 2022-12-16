import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomEntryField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
