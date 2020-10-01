import 'package:provider_practice/locator.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class LoginModel extends BaseModel {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    int userId = int.tryParse(userIdText);

    if (userId == null) {
      errorMessage = 'Not Numbered Value';

      setState(ViewState.Idle);

      return false;
    }

    bool loginSuccess = await _authenticationService.login(userId);

    return loginSuccess;
  }
}
