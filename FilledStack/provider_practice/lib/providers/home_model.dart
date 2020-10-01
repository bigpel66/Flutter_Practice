import 'package:provider_practice/locator.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future<void> fetchPosts(int userId) async {
    setState(ViewState.Busy);

    posts = await _api.getPostsOfUser(userId);

    setState(ViewState.Idle);
  }
}
