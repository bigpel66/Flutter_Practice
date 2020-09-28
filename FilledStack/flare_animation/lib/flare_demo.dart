import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';
// import 'smart_flare_animation.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  @override
  Widget build(BuildContext context) {
    double animationWidth = 295.0;
    double animationHeight = 251.0;

    double animationWidthThirds = animationWidth / 3;
    double animationHeightHalf = animationHeight / 2;

    List<ActiveArea> activeAreas = [
      ActiveArea(
        area: Rect.fromLTWH(
          0,
          0,
          animationWidthThirds,
          animationHeightHalf,
        ),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped',
      ),
      ActiveArea(
        area: Rect.fromLTWH(
          animationWidthThirds,
          0,
          animationWidthThirds,
          animationHeightHalf,
        ),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'pulse_tapped',
      ),
      ActiveArea(
        area: Rect.fromLTWH(
          animationWidthThirds * 2,
          0,
          animationWidthThirds,
          animationHeightHalf,
        ),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'image_tapped',
      ),
      ActiveArea(
          area: Rect.fromLTWH(
            0,
            animationHeightHalf,
            animationWidth,
            animationHeightHalf,
          ),
          // debugArea: true,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print('Toggle Animation');
          }),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 18, 222),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareActor(
          width: animationWidth,
          height: animationHeight,
          filename: 'assets/button-animation.flr',
          startingAnimation: 'deactivate',
          activeAreas: activeAreas,
        ),
        // Too many boilerplate code
        // child: SmartFlareAnimation(),
      ),
    );
  }
}
