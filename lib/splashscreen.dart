import 'package:flutter/material.dart';
import 'dart:async';
import 'package:forum/myhomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'Pixel'))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.indigo,
          Colors.black87,
        ],
      )),
      child: Stack(
        children: [
          Center(
              child: Text(
            'Pixel',
            style:
                TextStyle(color: Colors.white, decoration: TextDecoration.none),
          )),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
