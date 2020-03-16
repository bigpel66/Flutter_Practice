import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catAnimationController;

  Animation<double> flapAnimation;
  AnimationController flapAnimationController;

  void onTapHandler() {
    flapAnimationController.stop();

    if (catAnimationController.status == AnimationStatus.dismissed) {
      flapAnimationController.stop();
      catAnimationController.forward();
      // flapAnimationController.forward();
    } else if (catAnimationController.status == AnimationStatus.completed) {
      flapAnimationController.forward();
      catAnimationController.reverse();
      // flapAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.forward) {
      catAnimationController.reverse();
      // flapAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.reverse) {
      catAnimationController.forward();
      // flapAnimationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    catAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0, end: -80.0).animate(CurvedAnimation(
      parent: catAnimationController,
      curve: Curves.easeIn,
    ));

    flapAnimationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    flapAnimation =
        Tween(begin: pi * 0.6, end: pi * 0.65).animate(CurvedAnimation(
      parent: flapAnimationController,
      curve: Curves.easeInOut,
    ));

    flapAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        flapAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        flapAnimationController.forward();
      }
    });

    flapAnimationController.forward();
  }

  Widget buildBoxAnimation() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.brown,
      ),
    );
  }

  Widget buildLeftFlapAnimation() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: flapAnimation,
        builder: (ctx, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: flapAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 125,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.brown,
          ),
        ),
      ),
    );
  }

  Widget buildRightFlapAniamtion() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: flapAnimation,
        builder: (ctx, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -flapAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 125,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.brown,
          ),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (ctx, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          left: 0.0,
          right: 0.0,
        );
      },
      child: Cat(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        onTap: onTapHandler,
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBoxAnimation(),
              buildLeftFlapAnimation(),
              buildRightFlapAniamtion(),
            ],
          ),
        ),
      ),
    );
  }
}
