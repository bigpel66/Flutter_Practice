import 'package:meta/meta.dart';
import 'package:scoped_model_practice/locator.dart';
import 'package:scoped_model_practice/models/models.dart';
import 'package:scoped_model_practice/services/services.dart';
import 'package:scoped_model_practice/scoped_models/scoped_models.dart';

class FeedbackViewModel extends BaseModel {
  // Dummy data replaced to the data of Cloud Firestore
  // List<ListItem> listData;

  // Future fetchListData() async {
  //   setState(ViewState.Busy);

  //   await Future.delayed(Duration(seconds: 1));

  //   listData = List<ListItem>.generate(
  //     10,
  //     (index) => ListItem(
  //       title: 'title $index',
  //       description: 'Description of $index',
  //     ),
  //   );

  //   if (listData == null) {
  //     setState(ViewState.Error);
  //   } else {
  //     setState(
  //       listData.length == 0
  //           ? ViewState.NoDataAvailable
  //           : ViewState.DataFetched,
  //     );
  //   }
  // }

  FirebaseService _firebaseService = locator<FirebaseService>();
  List<UserFeedback> userFeedback = List<UserFeedback>();

  FeedbackViewModel() {
    _firebaseService.feedback.listen(_onFeedbackUpdated);
  }

  void _onFeedbackUpdated(List<UserFeedback> feedback) {
    userFeedback = feedback;

    if (userFeedback == null) {
      setState(ViewState.Busy);
    } else {
      setState(userFeedback.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  void markFeedbackAsRead({@required String feedbackId}) {
    _firebaseService.markFeedbackAsRead(feedbackId: feedbackId);
  }
}
