import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'splash/splashScreen.dart';
import 'doctorORpatient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        '/AnimatedSplashScreen': (BuildContext context) =>
            AnimatedSplashScreen(),
        '/DoctorOrPatient': (BuildContext context) => DoctorOrPatient(),
      },
      home: AnimatedSplashScreen(),
    );
  }
}
