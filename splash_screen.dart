import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upwork_task/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2550), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeftWithFade, child: Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlareActor(
          "assets/flar/SplashScreen.flr",
          fit: BoxFit.cover,
          animation: "Untitled",
        ),
      ),
    );
  }
}
