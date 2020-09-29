import 'package:flutter/material.dart';
import 'package:scoped_model_practice/locator.dart';
import 'package:scoped_model_practice/models/models.dart';
import 'package:scoped_model_practice/ui/views/views.dart';
import 'package:scoped_model_practice/ui/shared/shared.dart';
import 'package:scoped_model_practice/services/services.dart';
import 'package:scoped_model_practice/ui/widgets/widgets.dart';
import 'package:scoped_model_practice/scoped_models/scoped_models.dart';

class FeedbackView extends StatelessWidget {
  Widget _buildLoadingUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          Text('Fetching data ...'),
        ],
      ),
    );
  }

  Widget _buildCenteredViewMessage(
    BuildContext context,
    FeedbackViewModel model,
    String message, {
    bool error = false,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              style: viewErrorTitle,
              textAlign: TextAlign.center,
            ),
            error
                ? GestureDetector(
                    // Dummy data replaced to the data of Cloud Firestore
                    // onTap: () => model.fetchListData(),
                    onTap: () {
                      FirebaseService _firebaseService =
                          locator<FirebaseService>();

                      _firebaseService.initializeAppWithFetching();
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 45.0,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoDataUI(BuildContext context, FeedbackViewModel model) {
    return _buildCenteredViewMessage(
      context,
      model,
      'No data available yet',
    );
  }

  Widget _buildErrorUI(BuildContext context, FeedbackViewModel model) {
    return _buildCenteredViewMessage(
      context,
      model,
      'Error retrieving your data.\nTap to try again',
      error: true,
    );
  }

  // Dummy data replaced to the data of Cloud Firestore
  // Widget _buildListItemUI(ListItem item) {
  //   return Container(
  //     height: 100.0,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       color: lightGrey,
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(item.title, style: viewTitle),
  //         Text(item.description),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildListUI(FeedbackViewModel model) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      // Dummy data replaced to the data of Cloud Firestore
      // itemCount: model.listData.length,
      itemCount: model.userFeedback.length,
      itemBuilder: (BuildContext context, int index) {
        // Dummy data replaced to the data of Cloud Firestore
        // ListItem item = model.listData[index];
        // return _buildListItemUI(item);

        UserFeedback feedbackItem = model.userFeedback[index];
        return FeedbackItem(
          userFeedback: feedbackItem,
          onOpened: (feedbackId) {
            model.markFeedbackAsRead(feedbackId: feedbackId);
          },
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, FeedbackViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return _buildLoadingUI(context);
      case ViewState.NoDataAvailable:
        return _buildNoDataUI(context, model);
      case ViewState.Error:
        return _buildErrorUI(context, model);
      case ViewState.DataFetched:
      default:
        return _buildListUI(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedbackViewModel>(
      builder: (BuildContext context, Widget child, FeedbackViewModel model) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: <Widget>[
              WatcherToolBar(title: 'Feedback', showBackButton: true),
              Container(
                height: UIHelper.screenHeight(
                  context,
                  decreasedBy: WatcherToolBar.ToolBarHeight,
                ),
                child: _buildBody(context, model),
              ),
            ],
          ),
        );
      },
      // Dummy data replaced to the data of Cloud Firestore
      // onModelReady: (FeedbackViewModel model) => model.fetchListData(),
    );
  }
}
