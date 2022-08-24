import 'dart:async';

import 'package:ezara3_1/login_register/loginRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 3),
            (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>login_register()));
            });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Image.asset("assets/images/splash.jpeg"),
    );
  }
}
