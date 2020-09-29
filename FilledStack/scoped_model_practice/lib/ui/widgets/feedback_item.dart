import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model_practice/models/models.dart';
import 'package:scoped_model_practice/ui/shared/shared.dart';
import 'package:scoped_model_practice/ui/widgets/widgets.dart';

class FeedbackItem extends StatefulWidget {
  final Function(String) onOpened;
  final UserFeedback userFeedback;

  const FeedbackItem({
    @required this.userFeedback,
    @required this.onOpened,
  });

  @override
  _FeedbackItemState createState() => _FeedbackItemState();
}

class _FeedbackItemState extends State<FeedbackItem> {
  static const double DescriptionPadding = 15.0;

  double _height = 70.0;
  bool _showDetails = false;

  Widget get _detailSection => Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (!_showDetails) {
                _height = 190.0;
              } else {
                _height = 70.0;
              }
            });

            Timer.periodic(Duration(milliseconds: 150), (timer) {
              timer.cancel();

              if (widget.onOpened != null) {
                widget.onOpened(widget.userFeedback.id);
              }

              setState(() {
                _showDetails = !_showDetails;
              });
            });
          },
          child: Container(
            color: darkGrey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.userFeedback.title,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _showDetails
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: DescriptionPadding,
                        ),
                        child: Text(widget.userFeedback.details),
                      )
                    : Container(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FeedbackLabel(type: widget.userFeedback.type),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget get _notificationSection => Container(
        width: 50.0,
        child: Column(
          children: <Widget>[
            !widget.userFeedback.read
                ? Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: primaryColor,
                    ),
                  )
                : Container(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: lightGrey,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: darkGrey,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Row(
        children: <Widget>[
          _detailSection,
          _notificationSection,
        ],
      ),
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 200),
    );
  }
}
