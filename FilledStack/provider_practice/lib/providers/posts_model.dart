import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class PostsModel extends BaseModel {
  final Api api;

  PostsModel({this.api});

  List<Post> posts;

  Future<void> fetchPosts(int userId) async {
    setState(ViewState.Busy);

    posts = await api.getPostsOfUser(userId);

    setState(ViewState.Idle);
  }

  int postLikes(int postId) {
    return posts.firstWhere((post) => post.id == postId).likes;
  }

  void incrementLikes(int postId) async {
    posts.firstWhere((post) => post.id == postId).likes++;
    notifyListeners();
  }
}
