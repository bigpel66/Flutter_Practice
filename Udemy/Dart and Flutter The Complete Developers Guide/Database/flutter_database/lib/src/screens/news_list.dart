import 'package:flutter/material.dart';
import '../blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Text('Still Waiting on Ids');
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (ctx, index) {
            return Text(snapshot.data[index].toString());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    bloc.fetchTopIds();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }
}
