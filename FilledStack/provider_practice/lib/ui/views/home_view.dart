import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/ui/shared/shared.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/ui/widgets/widgets.dart';
import 'package:provider_practice/providers/providers.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget _buildPostUi(BuildContext context) {
    return BaseWidget<PostsModel>(
      builder: (BuildContext context, PostsModel model, Widget child) {
        return model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FittedBox(
                        child: LikeButton(postId: model.posts[index].id),
                      ),
                      PostListItem(
                        post: model.posts[index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePath.Post,
                            arguments: model.posts[index],
                          );
                        },
                      ),
                    ],
                  );
                },
              );
      },
      model: PostsModel(api: Provider.of<Api>(context)),
      onModelReady: (PostsModel model) {
        model.fetchPosts(Provider.of<User>(context).id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Here are all your posts',
              style: subHeaderStyle,
            ),
          ),
          UIHelper.verticalSpaceLarge(),
          Expanded(child: _buildPostUi(context)),
        ],
      ),
    );
  }
}
