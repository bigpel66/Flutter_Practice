import 'package:provider_practice/locator.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();

  List<Post> get posts => _postService.posts;

  Future<void> fetchPosts(int userId) async {
    setState(ViewState.Busy);

    await _postService.getPostsOfUser(userId);

    setState(ViewState.Idle);
  }
}
