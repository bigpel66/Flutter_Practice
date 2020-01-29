import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const cryptoCurrencyURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoValues = {};

    for (int i = 0; i < cryptoList.length; i++) {
      String requestURL =
          '$cryptoCurrencyURL/${cryptoList[i]}$selectedCurrency';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);

        double lastPrice = decodedData['last'];

        cryptoValues[cryptoList[i]] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

    return cryptoValues;
  }
}
