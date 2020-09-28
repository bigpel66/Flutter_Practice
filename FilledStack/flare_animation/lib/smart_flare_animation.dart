import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  PulseTapped,
  ImageTapped,
}

class SmartFlareAnimation extends StatefulWidget {
  @override
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  final FlareControls _flareControls = FlareControls();
  AnimationToPlay _animationToPlay = AnimationToPlay.Deactivate;
  AnimationToPlay _lastPlayedAnimation = AnimationToPlay.Deactivate;

  static const double AnimationWidth = 295.0;
  static const double AnimationHeight = 251.0;

  bool isOpen = false;

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
      case AnimationToPlay.Deactivate:
        return 'deactivate';
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.PulseTapped:
        return 'image_tapped';
      case AnimationToPlay.ImageTapped:
        return 'pulse_tapped';
        break;
      default:
        return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animationToPlay) {
    bool isTappedAnimation =
        _getAnimationName(animationToPlay).contains('tapped');

    if (isTappedAnimation &&
        _lastPlayedAnimation == AnimationToPlay.Deactivate) {
      return;
    }

    _flareControls.play(_getAnimationName(animationToPlay));
    _lastPlayedAnimation = animationToPlay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (TapUpDetails tapUpDetails) {
          // onTapUp Callback Function has the global position
          // Offset globalPosition = tapUpDetails.globalPosition;

          Offset localPosition = (context.findRenderObject() as RenderBox)
              .globalToLocal(tapUpDetails.globalPosition);

          bool topHalfTouched = localPosition.dy < AnimationHeight / 2;
          bool leftSideTouched = localPosition.dx < AnimationWidth / 3;
          bool rightSideTouched = localPosition.dx < AnimationWidth * 2 / 3;
          bool middleSideTouched = !leftSideTouched && !rightSideTouched;

          if (leftSideTouched && topHalfTouched) {
            _setAnimationToPlay(AnimationToPlay.CameraTapped);
          } else if (middleSideTouched && topHalfTouched) {
            _setAnimationToPlay(AnimationToPlay.PulseTapped);
          } else if (rightSideTouched && topHalfTouched) {
            _setAnimationToPlay(AnimationToPlay.ImageTapped);
          } else {
            if (isOpen) {
              _setAnimationToPlay(AnimationToPlay.Deactivate);
            } else {
              _setAnimationToPlay(AnimationToPlay.Activate);
            }

            isOpen = !isOpen;
          }
        },
        child: FlareActor(
          'assets/button-animation.flr',
          animation: _getAnimationName(_animationToPlay),
          controller: _flareControls,
        ),
      ),
    );
  }
}
