import 'package:cloud_firestore/cloud_firestore.dart';

class Stats {
  final int userCount;
  final int appCount;
  final int errorCount;

  Stats({this.userCount, this.appCount, this.errorCount});

  Stats.fromSnapshot(DocumentSnapshot snapshot)
      : userCount = snapshot.data()['userCount'] ?? 0,
        appCount = snapshot.data()['appCount'] ?? 0,
        errorCount = snapshot.data()['errorCount'] ?? 0;
}
