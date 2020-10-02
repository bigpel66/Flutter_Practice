import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class LoginModel extends BaseModel {
  // MultiProvider
  // AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

  final AuthenticationService authenticationService;

  LoginModel({this.authenticationService});

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    int userId = int.tryParse(userIdText);

    if (userId == null) {
      errorMessage = 'Not Numbered Value';

      setState(ViewState.Idle);

      return false;
    }

    bool loginSuccess = await authenticationService.login(userId);

    setState(ViewState.Idle);

    return loginSuccess;
  }
}
