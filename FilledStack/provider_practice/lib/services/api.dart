import 'dart:convert';
import 'package:http/http.dart';
import 'package:provider_practice/models/models.dart';

class Api {
  static const EndPoint = 'https://jsonplaceholder.typicode.com';

  Client client = Client();

  Future<User> getUserProfile(int userId) async {
    Response response = await client.get('$EndPoint/users/$userId');

    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsOfUser(int userId) async {
    List<Post> posts = List<Post>();

    Response response = await client.get('$EndPoint/posts?postId=$userId');

    (json.decode(response.body) as List<dynamic>).forEach((singlePost) {
      posts.add(Post.fromJson(singlePost));
    });

    return posts;
  }

  Future<List<Comment>> getCommentOfPost(int postId) async {
    List<Comment> comments = List<Comment>();

    Response response = await client.get('$EndPoint/comments?postId=$postId');

    (json.decode(response.body) as List<dynamic>).forEach((singleComment) {
      comments.add(Comment.fromJson(singleComment));
    });

    return comments;
  }
}
