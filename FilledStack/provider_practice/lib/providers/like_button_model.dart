import 'package:provider_practice/locator.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class LikeButtonModel extends BaseModel {
  PostService _postService = locator<PostService>();

  int postLikes(int postId) {
    return _postService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void incrementLikes(int postId) {
    _postService.incrementLikes(postId);
    notifyListeners();
  }
}
