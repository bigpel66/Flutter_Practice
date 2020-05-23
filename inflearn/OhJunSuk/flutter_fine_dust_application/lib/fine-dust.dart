import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './api-key.dart';

class FineDust extends StatefulWidget {
  static const routeName = '/fine-dust';

  @override
  _FineDustState createState() => _FineDustState();
}

class _FineDustState extends State<FineDust> {
  Future<void> getDataFromAPI() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Fine Dust Measuer API',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('text'),
                          Text('text', style: TextStyle(fontSize: 40.0)),
                          Text('text', style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('text'),
                              const SizedBox(width: 16.0),
                              Text('text℃', style: TextStyle(fontSize: 16.0)),
                            ],
                          ),
                          Text('Humidity'),
                          Text('Wind'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    getDataFromAPI();
                  });
                },
                color: Colors.orange,
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
