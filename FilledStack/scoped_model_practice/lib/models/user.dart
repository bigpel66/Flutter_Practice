class User {
  final String userId;
  final String username;
  final String email;
  final String accessToken;

  User({
    this.userId,
    this.username,
    this.email,
    this.accessToken,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        username = json['username'],
        email = json['email'],
        accessToken = json['accessToken'];
}
