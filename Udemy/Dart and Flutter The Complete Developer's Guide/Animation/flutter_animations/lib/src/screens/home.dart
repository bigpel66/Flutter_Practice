import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catAnimationController;

  void onTapHandler() {
    if (catAnimationController.status == AnimationStatus.dismissed) {
      catAnimationController.forward();
    } else if (catAnimationController.status == AnimationStatus.completed) {
      catAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.forward) {
      catAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.reverse) {
      catAnimationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    catAnimationController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: catAnimationController,
      curve: Curves.easeIn,
    ));
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (ctx, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
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
        child: buildAnimation(),
      ),
    );
  }
}
