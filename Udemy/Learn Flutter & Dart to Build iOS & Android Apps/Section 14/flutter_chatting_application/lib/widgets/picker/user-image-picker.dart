import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickHandler;

  UserImagePicker({this.imagePickHandler});

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    File imageFromGallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
      maxHeight: 150,
    );

    if (imageFromGallery != null) {
      setState(() {
        _pickedImage = imageFromGallery;
      });
      widget.imagePickHandler(_pickedImage);
    }
  }

  void _clearImage() {
    setState(() {
      _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              onPressed: _pickImage,
              icon: Icon(Icons.image),
              label: Text('Add Image'),
            ),
            FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              onPressed: _clearImage,
              icon: Icon(Icons.clear),
              label: Text('Clear Image'),
            ),
          ],
        ),
      ],
    );
  }
}
