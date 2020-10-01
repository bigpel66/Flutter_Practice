import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/ui/shared/shared.dart';
import 'package:provider_practice/ui/widgets/widgets.dart';
import 'package:provider_practice/providers/providers.dart';

class HomeView extends StatelessWidget {
  Widget _buildPostUi(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (BuildContext context, HomeModel model, Widget child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : Column(
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
                    Expanded(child: _buildPostUi(model.posts)),
                  ],
                ),
        );
      },
      onModelReady: (HomeModel model) {
        model.fetchPosts(Provider.of<User>(context).id);
      },
    );
  }
}
