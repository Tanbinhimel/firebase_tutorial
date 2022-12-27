import 'package:flutter/material.dart';

class AuthPageButton extends StatelessWidget {
  const AuthPageButton(
      {Key? key, required this.buttonText, required this.onPressedButton})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
          onPressed: onPressedButton,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.deepPurple),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            child: Text(buttonText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          )),
    );
  }
}
