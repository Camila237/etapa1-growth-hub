import 'dart:async';
import 'package:flutter/material.dart';

import 'package:etapa1/config/router/router_constants.dart';
import '../../../config/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = kNone;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: int.parse(kSize2.toString())), () {
      Navigator.pushReplacementNamed(context, kHomeScreen,);
    });
    Timer(Duration(milliseconds: int.parse(kSize100.toString())), () {
      setState(() {
        _opacity = kSize1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCrayola,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: int.parse(kSize2.toString())),
          child: const Icon(
            Icons.shopping_bag,
            size: kSize100,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}