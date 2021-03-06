import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'repository.dart';

final root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    try {
      final repsonse = await client.get(
        '$root/topstories.json',
      );
      final ids = json.decode(repsonse.body);

      return ids.cast<int>();
    } catch (error) {
      throw error;
    }
  }

  Future<ItemModel> fetchItem(int id) async {
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
