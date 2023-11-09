import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.onsaved,
      required this.validator, required this.maxlines});
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onsaved;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      validator: validator,
      onSaved: onsaved,
      style: TextStyle(fontSize: 20, color: Colors.blue),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintStyle: TextStyle(color: Colors.blue),
          hintText: hintText),
    );
  }
}
