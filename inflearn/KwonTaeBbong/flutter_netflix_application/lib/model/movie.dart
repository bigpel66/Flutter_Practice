import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference documentReference;

  Movie.fromMap(Map<String, dynamic> map, {this.documentReference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  //TODO: GET 7
  Movie.fromSnapshot(DocumentSnapshot documentSnapshot)
      : this.fromMap(
          documentSnapshot.data,
          documentReference: documentSnapshot.reference,
        );

  @override
  String toString() {
    return 'Movie<$title:$keyword>';
  }
}
