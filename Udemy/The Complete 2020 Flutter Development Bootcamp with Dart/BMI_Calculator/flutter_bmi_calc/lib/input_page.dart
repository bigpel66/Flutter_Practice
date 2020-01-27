import 'package:flutter/material.dart';
import './reusable_card.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                  ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                ],
              ),
            ),
            ReusableCard(
              color: Color(0xFF1D1E33),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                  ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                ],
              ),
            ),
          ],
        ),
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
