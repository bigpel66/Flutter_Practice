import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreatePage extends StatefulWidget {
  static const routeName = '/create-page';

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEdidtingController = TextEditingController();
  List<Asset> _images = List<Asset>();

  @override
  void dispose() {
    textEdidtingController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('새 게시물'),
      actions: <Widget>[
        IconButton(
          onPressed: () => {},
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
                controller: textEdidtingController,
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
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadMultiImages,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
