import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './detail-screen.dart';
import '../model/movie.dart';

class DibScreen extends StatefulWidget {
  @override
  _DibScreenState createState() => _DibScreenState();
}

class _DibScreenState extends State<DibScreen> {
  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('movie')
          .where('like', isEqualTo: true)
          .snapshots(),
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
    // List<DocumentSnapshot> searchResults = [];

    // for (DocumentSnapshot document in documents) {
    //   if (document.data.toString().contains(_searchText)) {
    //     searchResults.add(document);
    //   }
    // }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: const EdgeInsets.all(3.0),
        children:
            documents.map((result) => _buildListItem(context, result)).toList(),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    DocumentSnapshot documentSnapshot,
  ) {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/bbongflix_logo.png',
                    fit: BoxFit.contain,
                    height: 25.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Dibs',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }
}
