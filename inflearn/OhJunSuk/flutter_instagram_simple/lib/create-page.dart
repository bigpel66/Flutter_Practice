import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreatePage extends StatefulWidget {
  static const routeName = '/create-page';

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  List<Asset> _images = List<Asset>();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> uploadImages(BuildContext context) async {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final FirebaseUser userInfo = routeArgs['userInfo'];

    _images.forEach((image) async {
      ByteData byteData = await image.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      StorageReference ref = FirebaseStorage.instance
          .ref()
          .child('post')
          .child('${DateTime.now().millisecondsSinceEpoch}.png');
      StorageUploadTask uploadTask =
          ref.putData(imageData, StorageMetadata(contentType: 'image/png'));
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      DocumentReference doc = Firestore.instance.collection('post').document();
      await doc.setData({
        'id': doc.documentID,
        'imageUrl': imageUrl.toString(),
        'content': textEditingController.text,
        'email': userInfo.email,
        'displayName': userInfo.displayName,
        'userPhotoUrl': userInfo.photoUrl,
      });
    });
  }

  Widget _buildAppBar(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final FirebaseUser userInfo = routeArgs['userInfo'];

    return AppBar(
      title: Text('새 게시물'),
      actions: <Widget>[
        IconButton(
          onPressed: () async {
            await uploadImages(context);

            Navigator.of(context).pop();
          },
          icon: Icon(Icons.send),
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _images.isEmpty
              ? Text('No Image')
              : Container(
                  width: double.infinity,
                  height: 180.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: Card(
                          elevation: 4.0,
                          child: AssetThumb(
                            asset: _images[index],
                            width: 80,
                            height: 80,
                          ),
                        ),
                      );
                    },
                  ),
                ),
          SizedBox(
            height: 60.0,
            child: Center(
              child: TextField(
                decoration: InputDecoration(hintText: '내용을 입력하세요.'),
                controller: textEditingController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadMultiImages() async {
    List<Asset> resultList = List<Asset>();
    bool check = true;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: _images ?? [],
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (err) {
      if (err.toString() != 'The user has cancelled the selection') {
        throw err.toString();
      } else {
        check = false;
      }
    }

    if (!mounted) return;

    if (check) {
      setState(() {
        _images = resultList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadMultiImages,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
