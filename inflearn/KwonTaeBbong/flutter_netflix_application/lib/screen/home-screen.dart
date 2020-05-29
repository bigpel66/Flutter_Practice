import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/carousel-image.dart';
import '../widget/circle-slider.dart';
import '../widget/box-slider.dart';
import '../model/movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Firestore firestore = Firestore.instance;

  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          );
        } else {
          if (snapshot.hasData) {
            return _buildBody(context, snapshot.data.documents);
          } else {
            return Text('Error Occured');
          }
        }
      },
    );
  }

  Widget _buildBody(
      BuildContext context, List<DocumentSnapshot> documentSnapshot) {
    List<Movie> movies = documentSnapshot
        .map((document) => Movie.fromSnapshot(document))
        .toList();

    return SafeArea(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CarouselImage(movies: movies),
              TopBar(),
            ],
          ),
          CircleSlider(movies: movies),
          BoxSlider(movies: movies),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25.0,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'TV Programs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Dibs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
