import 'dart:async';
import 'package:flutter/material.dart';

import '../../../config/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = kNone;
  final Duration _duration2Sec = Duration(seconds: kSize2.toInt());

  @override
  void initState() {
    super.initState();
    _setOpacity();
    _navigateToHome();
  }

  void _setOpacity() {
    Timer(Duration(milliseconds: int.parse(kSize100.toString())), () {
      setState(() {
        _opacity = kSize1;
      });
    });
  }

  void _navigateToHome() {
    Timer(_duration2Sec, () {
      Navigator.pushReplacementNamed(context, kHomeScreen);
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