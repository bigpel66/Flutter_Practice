import 'package:flutter/material.dart';
import './reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: activeCardColor,
                ),
                ReusableCard(
                  color: activeCardColor,
                ),
              ],
            ),
          ),
          ReusableCard(
            color: activeCardColor,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: activeCardColor,
                ),
                ReusableCard(
                  color: activeCardColor,
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.purple),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
