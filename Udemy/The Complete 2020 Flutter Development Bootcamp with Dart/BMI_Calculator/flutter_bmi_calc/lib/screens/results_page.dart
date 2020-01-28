import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final bmiMeasure = routeArgs['bmiMeasure'];
    final bmiResult = routeArgs['bmiResult'];
    final bmiDescription = routeArgs['bmiDescription'];

    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: resultTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('${bmiResult.toUpperCase()}', style: resultMeasureTextStyle),
                  Text('$bmiMeasure', style: resultBMITextStyle),
                  Text(
                    '$bmiDescription',
                    textAlign: TextAlign.center,
                    style: resultDescriptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTapHandler: () {
              Navigator.of(context).pop();
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
