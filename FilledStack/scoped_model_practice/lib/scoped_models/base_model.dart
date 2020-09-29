import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_practice/enums/enums.dart';

// The Widget which is inheriting the BaseModel does not have to import ViewState
export 'package:scoped_model_practice/enums/enums.dart';

class BaseModel extends Model {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
