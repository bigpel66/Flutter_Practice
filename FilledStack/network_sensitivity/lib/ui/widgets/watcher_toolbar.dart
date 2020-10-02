import 'package:flutter/material.dart';

class WatcherToolbar extends StatelessWidget {
  static const double ToolbarHeight = 80.0;

  final String title;
  final bool showBackButton;

  const WatcherToolbar({
    @required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ToolbarHeight,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          showBackButton
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
