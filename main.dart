import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constant/ColorGolobal.dart';

import 'Constant/frequentWidget.dart';
import 'splash_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    timeDilation = 2.0;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: SizeFixed.key,
      theme: ThemeData(
        primaryColor: ColorGlobal.colorPrimary,
        hintColor: ColorGlobal.colorAccent,
        scaffoldBackgroundColor: ColorGlobal.colorPrimaryDark,
        fontFamily: "OpenSans",
      ),
      home: SplashScreen(),
    );
  }
}
