import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/providers/providers.dart';
import 'package:provider_practice/services/services.dart';

class CommentsModel extends BaseModel {
  // MultiProvider
  // Api _api = locator<Api>();

  final Api api;

  CommentsModel({this.api});

  List<Comment> comments;

  Future<void> fetchComents(int postId) async {
    setState(ViewState.Busy);

    comments = await api.getCommentOfPost(postId);

    setState(ViewState.Idle);
  }
}
