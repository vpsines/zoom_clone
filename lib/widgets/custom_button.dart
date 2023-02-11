import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const CustomButton(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: const Size(
              double.infinity,
              50
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          child: Text(
            buttonText,
            style:const TextStyle(
              fontSize: 17,
            ),
          ),
          ),
    );
  }
}
