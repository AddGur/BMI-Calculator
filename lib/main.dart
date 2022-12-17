import 'package:flutter/material.dart';
import 'package:udemy11_bmi_calculator/screens/results_screen.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF0E0F20),
            ),
        scaffoldBackgroundColor: Color(0xFF0E0F20),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: Color(0XFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            trackShape: RectangularSliderTrackShape()),
      ),
      home: InputPage(),
    );
  }
}
