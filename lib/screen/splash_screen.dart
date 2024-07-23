import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState(){
  super.initState();
  Timer(Duration(seconds:3),() { 
    Navigator.push(context,MaterialPageRoute(builder: (context)=> homeScreen()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage("assets/barbie.jpeg"),
          fit: BoxFit.cover,
          opacity: 0.5,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 50,horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/logo.jpeg"),
            ),
            )
          ],
        ),
      ),
    );
  }
}