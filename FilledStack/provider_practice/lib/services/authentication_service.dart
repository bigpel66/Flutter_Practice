import 'dart:async';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  final StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    User fetchedUser = await _api.getUserProfile(userId);

    bool hasUser = fetchedUser != null;

    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }
}
