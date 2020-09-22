import 'package:flutter/material.dart';
import 'package:tiktok_ui/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  Widget get topSection => Container(
        alignment: Alignment(0.0, 1.0),
        padding: const EdgeInsets.only(bottom: 15.0),
        height: 100.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Following'),
            SizedBox(width: 15.0),
            Text(
              'For You',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget get middleSection => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            VideoDescription(),
            ActionsToolBar(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          topSection,
          middleSection,
          BottomToolBar(),
        ],
      ),
    );
  }
}
