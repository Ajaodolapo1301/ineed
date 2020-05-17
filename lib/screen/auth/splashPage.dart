import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ineed_app/screen/auth/login.dart';
import 'package:ineed_app/screen/home.dart';




class SplashPage extends StatefulWidget {
  final  user;
  SplashPage({this.user});
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {





  @override
  void initState() {

    super.initState();

    Timer(Duration(seconds: 5,) , ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()))  );
    print(widget.user);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
      Container(
      child: new DecoratedBox(
      decoration: new BoxDecoration(
      image: new DecorationImage(
          image: new AssetImage("images/strta.png"),
      fit: BoxFit.fill,
    ),
    ),
    ),
    ),



        ],
      ),
    );
  }
}


