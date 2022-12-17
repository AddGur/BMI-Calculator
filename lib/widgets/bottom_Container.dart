import 'package:flutter/material.dart';
import 'package:udemy11_bmi_calculator/const/constans.dart';

class BottomContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const BottomContainer(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
