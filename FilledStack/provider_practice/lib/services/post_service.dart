import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';

class PostService {
  Api _api = locator<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future<void> getPostsOfUser(int userId) async {
    _posts = await _api.getPostsOfUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}
