import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './detail-screen.dart';
import '../model/movie.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _searchText = '';

  //TODO: GET 6
  _SearchScreenState() {
    _textEditingController.addListener(() {
      setState(() {
        _searchText = _textEditingController.text;
      });
    });
  }

  //TODO: GET 9
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return _buildList(context, snapshot.data.documents);
          } else {
            return Text('Error Occured');
          }
        }
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> documents) {
    List<DocumentSnapshot> searchResults = [];

    for (DocumentSnapshot document in documents) {
      if (document.data.toString().contains(_searchText)) {
        searchResults.add(document);
      }
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: const EdgeInsets.all(3.0),
        children: searchResults
            .map((result) => _buildListItem(context, result))
            .toList(),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, DocumentSnapshot documentSnapshot) {
    final Movie movie = Movie.fromSnapshot(documentSnapshot);

    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Image.network(
          movie.poster,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailScreen(movie: movie);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            // const Padding(padding: const EdgeInsets.all(10.0)),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    //TODO: GET 8
                    child: TextField(
                      focusNode: _focusNode,
                      style: TextStyle(fontSize: 15),
                      autofocus: true,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white60,
                          size: 20.0,
                        ),
                        suffixIcon: _focusNode.hasFocus
                            ? IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  setState(() {
                                    _textEditingController.clear();
                                    _searchText = '';
                                  });
                                },
                              )
                            : Container(),
                        hintText: 'Search',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  _focusNode.hasFocus
                      ? Expanded(
                          child: FlatButton(
                            onPressed: () {
                              _textEditingController.clear();
                              _searchText = '';
                              _focusNode.unfocus();
                            },
                            child: FittedBox(child: Text('Cancel')),
                          ),
                        )
                      : Expanded(flex: 0, child: Container()),
                ],
              ),
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }
}
