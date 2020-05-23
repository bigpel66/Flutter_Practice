import 'dart:async';

enum AuthState {
  Authenticated,
  UnAuthenticated,
}

class AuthRepository {
  StreamController _streamController = StreamController<AuthState>()
    ..add(AuthState.UnAuthenticated);

  Stream<AuthState> get authStream => _streamController.stream;

  setAuthState(AuthState authState) {
    _streamController.add(authState);
  }

  void dispose() {
    _streamController.close();
  }
}
