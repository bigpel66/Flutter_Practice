import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<dynamic> fetchTopIds() async {
    try {
      final repsonse = await client.get(
        '$root/topstories.json',
      );
      final ids = json.decode(repsonse.body);

      return ids;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> fetchItem(int id) async {
    try {
      final response = await client.get(
        '$root/item/$id.json',
      );
      final parsedJson = json.decode(response.body);

      return ItemModel.fromJson(parsedJson);
    } catch (error) {
      throw error;
    }
  }
}
