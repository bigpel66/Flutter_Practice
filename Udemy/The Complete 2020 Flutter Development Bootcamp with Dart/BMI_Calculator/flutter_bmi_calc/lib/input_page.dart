import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reusable_card.dart';
import './icon_content.dart';
import './constants.dart';
import './round_icon_button.dart';
import './results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180.0;
  double weight = 60.0;
  int age = 19;

  bool _buttonPressed = false;
  bool _loopActivated = false;

  void _setValueWhilePrssed(int caseNumber) async {
    if (_loopActivated) return;

    _loopActivated = true;

    while (_buttonPressed) {
      switch (caseNumber) {
        case 1:
          setState(() {
            if (weight > 0) weight = weight - 0.5;
          });
          break;
        case 2:
          setState(() {
            if (weight < 200) weight = weight + 0.5;
          });
          break;
        case 3:
          setState(() {
            if (age > 0) age--;
          });
          break;
        case 4:
          setState(() {
            if (age < 110) age++;
          });
          break;
      }

      await Future.delayed(Duration(milliseconds: 100));
    }
    _loopActivated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressHandler: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressHandler: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: textStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height,
                      min: 120.0,
                      max: 240.0,
                      onChanged: (value) {
                        setState(() {
                          height = double.parse(value.toStringAsFixed(1));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          '$weight',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (weight > 0) weight = weight - 0.5;
                                });
                              },
                              onLongPressStart: (_) {
                                _buttonPressed = true;
                                _setValueWhilePrssed(1);
                              },
                              onLongPressEnd: (_) {
                                _buttonPressed = false;
                              },
                              child:
                                  RoundIconButton(icon: FontAwesomeIcons.minus),
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (weight < 200) weight = weight + 0.5;
                                });
                              },
                              onLongPressStart: (_) {
                                _buttonPressed = true;
                                _setValueWhilePrssed(2);
                              },
                              onLongPressEnd: (_) {
                                _buttonPressed = false;
                              },
                              child:
                                  RoundIconButton(icon: FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          '$age',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                              onLongPressStart: (_) {
                                _buttonPressed = true;
                                _setValueWhilePrssed(3);
                              },
                              onLongPressEnd: (_) {
                                _buttonPressed = false;
                              },
                              child:
                                  RoundIconButton(icon: FontAwesomeIcons.minus),
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (age < 110) age++;
                                });
                              },
                              onLongPressStart: (_) {
                                _buttonPressed = true;
                                _setValueWhilePrssed(4);
                              },
                              onLongPressEnd: (_) {
                                _buttonPressed = false;
                              },
                              child:
                                  RoundIconButton(icon: FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ResultsPage.routeName);
            },
            child: Container(
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(
                  child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
