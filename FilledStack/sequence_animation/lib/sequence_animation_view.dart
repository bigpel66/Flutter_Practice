import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SequenceAnimationView extends StatefulWidget {
  SequenceAnimationView({Key key}) : super(key: key);

  @override
  _SequenceAnimationViewState createState() => _SequenceAnimationViewState();
}

class _SequenceAnimationViewState extends State<SequenceAnimationView>
    with TickerProviderStateMixin {
  bool show = false;
  AnimationController _animationController;
  var sequenceAnimation;
  SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 200.0),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 300),
          tag: 'grow',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 400),
          tag: 'fade-in',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 100.0, end: 0.0),
          from: const Duration(microseconds: 300),
          to: const Duration(milliseconds: 800),
          tag: 'margin-slide',
        )
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton(
              child: Text('animate'),
              onPressed: () {
                setState(() {
                  show = !show;

                  if (show) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
            ),
            show
                ? AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: _sequenceAnimation['fade-in'].value,
                        child: Container(
                          color: Colors.purple,
                          width: MediaQuery.of(context).size.width,
                          height: _sequenceAnimation['grow'].value,
                          margin: EdgeInsets.only(
                            left: _sequenceAnimation['margin-slide'].value,
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
