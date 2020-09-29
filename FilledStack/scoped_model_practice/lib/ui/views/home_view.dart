import 'package:flutter/material.dart';
import 'package:scoped_model_practice/ui/shared/shared.dart';
import 'package:scoped_model_practice/ui/views/views.dart';
import 'package:scoped_model_practice/scoped_models/scoped_models.dart';
import 'package:scoped_model_practice/ui/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  static const BoxDecoration topLineBorderDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(
        color: lightGrey,
        style: BorderStyle.solid,
        width: 5.0,
      ),
    ),
  );

  Widget _buildHeightContainer({
    BuildContext context,
    double height,
    Widget child,
    bool hasTopStroke = false,
  }) {
    return Container(
      alignment: Alignment.center,
      decoration: hasTopStroke ? topLineBorderDecoration : null,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: child,
    );
  }

  Widget _buildStatusUi(BuildContext context, HomeViewModel model) {
    return Column(
      children: <Widget>[
        WatcherToolBar(title: 'SKELETON WATCHER'),
        _buildHeightContainer(
          context: context,
          height: UIHelper.screenHeight(
            context,
            dividedBy: 2,
            decreasedBy: WatcherToolBar.ToolBarHeight,
          ),
          child: StatsCounter(
            size: UIHelper.screenHeight(
                  context,
                  dividedBy: 2,
                  decreasedBy: WatcherToolBar.ToolBarHeight,
                ) -
                60.0,
            count: model.appStats.errorCount,
            title: 'Errors',
            titleColor: Colors.red,
          ),
        ),
        _buildHeightContainer(
          context: context,
          height: UIHelper.screenHeight(
            context,
            dividedBy: 3,
            decreasedBy: WatcherToolBar.ToolBarHeight,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StatsCounter(
                  size: UIHelper.screenHeight(
                        context,
                        dividedBy: 3,
                        decreasedBy: WatcherToolBar.ToolBarHeight,
                      ) -
                      60.0,
                  count: model.appStats.userCount,
                  title: 'Users',
                ),
                StatsCounter(
                  size: UIHelper.screenHeight(
                        context,
                        dividedBy: 3,
                        decreasedBy: WatcherToolBar.ToolBarHeight,
                      ) -
                      60.0,
                  count: model.appStats.appCount,
                  title: 'Apps Created',
                ),
              ],
            ),
          ),
        ),
        _buildHeightContainer(
          height: UIHelper.screenHeight(
            context,
            dividedBy: 6,
            decreasedBy: WatcherToolBar.ToolBarHeight,
          ),
          child: IndicatorButton(
            title: 'Feedback',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FeedbackView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
      case ViewState.Idle:
        return Center(child: CircularProgressIndicator());
      default:
        return _buildStatusUi(context, model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (BuildContext context, Widget child, HomeViewModel model) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: _buildBody(context, model),
        );
      },
    );
  }
}
