// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_projects/modules/onboarding/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Onboarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        width: double.infinity,
        child: Center(
            child: Image.asset('assets/images/logo1a.png',),
          ),
      ),
    );
  }
}