import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser currentUser;

  CreatePage({@required this.currentUser});

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  File _image;

  Future _getImage() async {
    File _selectedImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxWidth: 640,
      maxHeight: 480,
    );

    if (_selectedImage != null) {
      setState(() {
        _image = _selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('새 게시물'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            try {
              _uploadFile(context);
            } catch (err) {
              throw err;
            }
          },
          child: Text('공유'),
        )
      ],
    );
  }

  Future _uploadFile(BuildContext context) async {
    final StorageReference _storageReference = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');
    final StorageUploadTask _storageUploadTask = _storageReference.putFile(
        _image, StorageMetadata(contentType: 'image/png'));
    final StorageTaskSnapshot _storageTaskSnapshot =
        await _storageUploadTask.onComplete;
    final String imageUrl = await _storageTaskSnapshot.ref.getDownloadURL()
      ..toString();

    DocumentReference documentReference =
        Firestore.instance.collection('post').document();

    await documentReference.setData({
      'id': documentReference.documentID,
      'imageUrl': imageUrl,
      'content': textEditingController.text,
      'email': widget.currentUser.email,
      'photoUrl': widget.currentUser.photoUrl,
      'displayName': widget.currentUser.displayName,
      'createdAt': Timestamp.now(),
      'lastComment': '',
    });

    Navigator.pop(context);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                _buildImage(),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '문구 입력...',
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Text('사람 태그하기'),
          ),
          Divider(),
          ListTile(
            leading: Text('위치 추가하기'),
          ),
          Divider(),
          _buildLocation(),
          ListTile(
            leading: Text('위치 추가하기'),
          ),
          ListTile(
            leading: Text('Facebook'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            leading: Text('Twitter'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            leading: Text('Tumblr'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          Divider(),
          ListTile(
            leading: Text(
              '고급 설정',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return _image == null
        ? Text('No Image')
        : InkWell(
            onTap: _getImage,
            child: Image.file(
              _image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
  }

  Widget _buildLocation() {
    final locationItems = [
      '꿈두레 도서관',
      '경기도 오산',
      '오산세교',
      '동탄2신도시',
      '동탄',
      '검색',
    ];
    return SizedBox(
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: locationItems.map((location) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Chip(
              label: Text(
                location,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
