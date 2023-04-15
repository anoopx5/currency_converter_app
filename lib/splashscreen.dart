import 'package:currency/myhome.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      print('Navigating to MyApp widget');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'image/Poster.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircularProgressIndicator(
                  strokeWidth: 4.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff004294)))
            ]),
      ),
    );
  }
}
