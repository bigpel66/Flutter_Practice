import 'package:flutter/material.dart';
import 'package:network_sensitivity/ui/shared/shared.dart';
import 'package:network_sensitivity/ui/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  static const int CounterMargins = 60;

  _buildHeightContainer(
      {BuildContext context,
      double height,
      Widget child,
      bool hasTopStroke = false}) {
    return Container(
      alignment: Alignment.center,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          WatcherToolbar(title: 'Skeleton Watcher'),
          _buildHeightContainer(
            context: context,
            height: UIHelper.screenHeight(
              context,
              dividedBy: 2,
              decreasedBy: WatcherToolbar.ToolbarHeight,
            ),
            child: NetworkSensitive(
              child: StatsCounter(
                size: UIHelper.screenHeight(
                      context,
                      dividedBy: 2,
                      decreasedBy: WatcherToolbar.ToolbarHeight,
                    ) -
                    CounterMargins,
                count: 13,
                title: 'Errors',
                titleColor: Colors.red,
              ),
            ),
          ),
          _buildHeightContainer(
            context: context,
            height: UIHelper.screenHeight(
              context,
              dividedBy: 3,
              decreasedBy: WatcherToolbar.ToolbarHeight,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NetworkSensitive(
                    child: StatsCounter(
                      size: UIHelper.screenHeight(
                            context,
                            dividedBy: 3,
                            decreasedBy: WatcherToolbar.ToolbarHeight,
                          ) -
                          CounterMargins,
                      count: 55,
                      title: 'Users',
                    ),
                  ),
                  StatsCounter(
                    size: UIHelper.screenHeight(
                          context,
                          dividedBy: 3,
                          decreasedBy: WatcherToolbar.ToolbarHeight,
                        ) -
                        CounterMargins,
                    count: 2,
                    title: 'Apps Created',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
