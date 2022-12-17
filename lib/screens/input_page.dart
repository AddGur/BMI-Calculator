import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy11_bmi_calculator/const/calculator_brain.dart';
import 'package:udemy11_bmi_calculator/widgets/bottom_Container.dart';
import 'package:udemy11_bmi_calculator/screens/results_screen.dart';
import '../const/constans.dart';
import '../widgets/reusable.card.dart';
import '../widgets/icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _height = 170;
  int _weight = 60;
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild:
                        IconContent(label: 'Male', icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                        label: 'Female', icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toStringAsFixed(0),
                          style: kWeightTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: Theme.of(context).sliderTheme,
                      child: Slider(
                        value: _height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0XFF8D8E98),
                        onChanged: (double value) {
                          setState(() {
                            _height = value.round();
                          });
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueChanger(value: _weight, titleText: 'WEIGHT'),
                ValueChanger(value: _age, titleText: 'AGE'),
              ],
            ),
          ),
          BottomContainer(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(_height, _weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation())));
              },
              buttonText: 'CALCULATE')
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}

class ValueChanger extends StatefulWidget {
  int value;
  final String titleText;
  ValueChanger({super.key, required this.value, required this.titleText});

  @override
  State<ValueChanger> createState() => _ValueChangerState();
}

class _ValueChangerState extends State<ValueChanger> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.titleText,
            style: kLableTextStyle,
          ),
          Text(
            widget.value.toString(),
            style: kWeightTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      widget.value--;
                    });
                  }),
              SizedBox(
                width: 15,
              ),
              RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      widget.value++;
                    });
                  }),
            ],
          )
        ]),
      ),
    );
  }
}
