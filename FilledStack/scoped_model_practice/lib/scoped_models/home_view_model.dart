import 'package:scoped_model_practice/locator.dart';
import 'package:scoped_model_practice/models/models.dart';
import 'package:scoped_model_practice/scoped_models/scoped_models.dart';
import 'package:scoped_model_practice/services/services.dart';

class HomeViewModel extends BaseModel {
  FirebaseService _firebaseService = locator<FirebaseService>();
  Stats appStats;
  int unreadCount;

  HomeViewModel() {
    _firebaseService.appStats.listen(_onStatsUpdated);
    _firebaseService.unreadCount.listen(_onUnreadCountUpdated);
  }

  void _onStatsUpdated(Stats stats) {
    appStats = stats;

    if (appStats == null) {
      setState(ViewState.Busy);
    } else {
      setState(ViewState.DataFetched);
    }
  }

  void _onUnreadCountUpdated(int count) {
    unreadCount = count;

    setState(ViewState.DataFetched);
  }
}
