import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.obscureText = false})
      : super(key: key);

  final String hintText;
  final TextEditingController textEditingController;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric( vertical: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
            controller: textEditingController,
            obscureText: obscureText,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText)));
  }
}
