import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/image_model.dart';
import './widgets/image_list.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ImageModel> imageModels = [];

  Future<void> fetchImage() async {
    var url = 'https://jsonplaceholder.typicode.com/photos/';

    http.Response response = await http.get(url);

    final parsedData = jsonDecode(response.body);

    for (var data in parsedData) {
      imageModels.add(ImageModel.fromJson(data));
    }

    setState(() {});

    print(imageModels.length);
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  // @override
  // void didChangeDependencies() async {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('appbar'),
        ),
        body: ImageList(
          imageModels: imageModels,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => fetchImage(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
