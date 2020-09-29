import 'dart:async';
import 'package:meta/meta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model_practice/models/models.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();
  Stream<Stats> get appStats => _statsController.stream;

  final StreamController<List<UserFeedback>> _userFeedbackController =
      StreamController<List<UserFeedback>>();
  Stream<List<UserFeedback>> get feedback => _userFeedbackController.stream;

  final StreamController<int> _unreadCountController = StreamController<int>();
  Stream<int> get unreadCount => _unreadCountController.stream;

  FirebaseService() {
    initializeAppWithFetching();
  }

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }

  List<UserFeedback> _getFeedbackFromSnapshot(QuerySnapshot snapshot) {
    List<UserFeedback> feedbackItems = List<UserFeedback>();
    List<QueryDocumentSnapshot> documentSnapshot = snapshot.docs;

    bool hasDocuments = documentSnapshot.length > 0;

    if (hasDocuments) {
      for (QueryDocumentSnapshot doc in documentSnapshot) {
        Map<String, dynamic> docData = doc.data();
        docData['id'] = doc.id;
        feedbackItems.add(UserFeedback.fromData(docData));
      }
    }

    return feedbackItems;
  }

  void _emitUnreadCount(List<UserFeedback> feedback) {
    int unreadCount = feedback.where((element) => !element.read).length;
    _unreadCountController.add(unreadCount);
  }

  void _feedbackAdded(QuerySnapshot snapshot) {
    List<UserFeedback> feedback = _getFeedbackFromSnapshot(snapshot);
    _userFeedbackController.add(feedback);
    _emitUnreadCount(feedback);
  }

  void initializeAppWithFetching() async {
    await Firebase.initializeApp();

    FirebaseFirestore.instance
        .collection('informations')
        .doc('project_stats')
        .snapshots()
        .listen(_statsUpdated);

    FirebaseFirestore.instance
        .collection('feedback')
        // .where('open', isEqualTo: true)
        .snapshots()
        .listen(_feedbackAdded);
  }

  void markFeedbackAsRead({@required String feedbackId}) {
    FirebaseFirestore.instance
        .collection('feedback')
        .doc(feedbackId)
        .update({'read': true});
  }
}
