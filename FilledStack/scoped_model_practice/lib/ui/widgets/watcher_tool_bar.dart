import 'package:flutter/material.dart';

class WatcherToolBar extends StatelessWidget {
  static const double ToolBarHeight = 80.0;

  final String title;
  final bool showBackButton;

  const WatcherToolBar({
    @required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.only(top: 30.0),
      height: ToolBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          showBackButton
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 50.0,
                    child: Icon(
                      Icons.chevron_left,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w800),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
