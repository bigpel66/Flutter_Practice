import 'dart:async';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';

class AuthenticationService {
  // MultiProivder
  // Api _api = locator<Api>();

  final Api api;

  AuthenticationService({this.api});

  final StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    User fetchedUser = await api.getUserProfile(userId);

    bool hasUser = fetchedUser != null;

    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }
}
