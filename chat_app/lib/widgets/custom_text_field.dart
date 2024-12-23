import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.onChanged, this.obscureText = false});

  final String? hintText;
  final Function(String data)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(color: kSecondaryColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kSecondaryColor),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kSecondaryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
