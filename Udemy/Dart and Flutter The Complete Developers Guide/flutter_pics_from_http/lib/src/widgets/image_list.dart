import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> imageModels;

  ImageList({@required this.imageModels});

  Widget buildImage(ImageModel image) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Image.network(
              image.url,
              fit: BoxFit.cover,
            ),
          ),
          Text(image.title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageModels.length,
      itemBuilder: (context, index) {
        return buildImage(imageModels[index]);
      },
    );
  }
}
