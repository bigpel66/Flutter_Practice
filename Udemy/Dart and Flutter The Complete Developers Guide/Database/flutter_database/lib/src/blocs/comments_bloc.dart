import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class CommentsBloc {
  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  final _repository = Repository();
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  Stream<Map<int, Future<ItemModel>>> get commentsOutput =>
      _commentsOutput.stream;

  Function(int) get fetchComments => _commentsFetcher.sink.add;

  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
      (cache, int id, index) {
        cache[id] = _repository.fetchItem(id);
        cache[id].then((ItemModel itemModel) {
          return itemModel.kids.forEach((kidId) {
            fetchComments(kidId);
          });
        });
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  void dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
