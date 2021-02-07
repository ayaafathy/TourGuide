import 'package:flutter/material.dart';
import 'package:tour_guide/main.dart';
import 'package:tour_guide/NotUsed/signin_UI.dart';

///import 'package:tour_guide/homepage.dart';

void main() {
  runApp(MyAnim());
}

class MyAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "animation",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogoAnimation(),
    );
  }
}

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  AnimationController ac;
  Animation a;

  @override
  void initState() {
    ac = AnimationController(duration: Duration(seconds: 6), vsync: this);

    a = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(curve: Curves.ease, parent: ac));

    ac.forward();

    ac.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => MyApp()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    ac?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(
      animation: a,
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Container(
      child: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          child: Image(image: AssetImage("assets/images/logo.jpg")),
        ),
      ),
      color: Colors.white,
    );
  }
}
