import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './coin_data.dart';
import './crypto_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  bool isWaiting = false;
  Map<String, String> cryptoValues = {};

  Widget getPicker() {
    if (Platform.isIOS)
      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedCurrency = currenciesList[index];

            getData();
          });
        },
        children: [
          ...currenciesList.map((item) {
            return Text(
              item,
            );
          }),
        ],
      );
    else
      return DropdownButton<String>(
        value: selectedCurrency,
        items: [
          ...currenciesList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          })
        ],
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;

            getData();
          });
        },
      );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;

      setState(() {
        cryptoValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...cryptoList.map((item) {
                return CryptoCard(
                  bitcoinValue: isWaiting ? '?' : cryptoValues[item],
                  selectedCurrency: selectedCurrency,
                  cryptoCurrency: item,
                );
              }),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
