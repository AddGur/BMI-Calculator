import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:udemy11_bmi_calculator/widgets/bottom_Container.dart';
import 'package:udemy11_bmi_calculator/const/constans.dart';
import 'package:udemy11_bmi_calculator/screens/input_page.dart';

class ResultScreen extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  static const routeName = '/routname';

  const ResultScreen(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Your Result',
                style: kWeightTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kActiveCardColour),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      widget.bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      widget.interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ]),
            ),
          ),
          BottomContainer(
              onTap: () {
                Navigator.of(context).pop(InputPage());
              },
              buttonText: 'RE-CALCULATE YOUR BMI')
        ],
      ),
    );
  }
}
