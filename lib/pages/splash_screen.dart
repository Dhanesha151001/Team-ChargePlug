// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:evcs1/pages/splash_services.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required String title}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  SplashServices splashScreen= SplashServices();

  @override
  void initState(){
    super.initState();
    splashScreen.isLogin(context);

  }

  _SplashScreenState(){
    Timer(
      const Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).secondaryHeaderColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 2.0,
                  offset: const Offset(5.0, 3.0),
                  spreadRadius: 2.0,
                )
              ]
            ),
            child: const Center(
              child: ClipOval(
                child: Icon(Icons.android_outlined, size: 128,), //put your logo here
              ),
            ),
          ),
        ),
      ),
    );
  }
}