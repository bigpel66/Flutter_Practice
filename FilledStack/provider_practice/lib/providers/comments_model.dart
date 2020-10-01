import 'package:provider_practice/locator.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/providers/providers.dart';
import 'package:provider_practice/services/services.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future<void> fetchComents(int postId) async {
    setState(ViewState.Busy);

    comments = await _api.getCommentOfPost(postId);

    setState(ViewState.Idle);
  }
}
