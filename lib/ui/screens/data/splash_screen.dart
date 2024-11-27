import 'dart:async';
import 'package:flutter/material.dart';
import 'package:etapa1/domain/router/router_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';

/// * Screen to display the splash screen.
/// * This screen displays the application logo while the application is loading.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = kNone;
  final Duration _duration2Sec = Duration(seconds: kSize2.round());

  @override
  void initState() {
    super.initState();
    _setOpacity();
    _navigateToHome();
  }

  /// * Sets the opacity of the icon to 1 after 1 second.
  void _setOpacity() {
    Timer(Duration(milliseconds: int.parse(kSize100.round().toString())), () {
      setState(() {
        _opacity = kSize1;
      });
    });
  }

  /// * Navigates to the home screen after 2 seconds.
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
          duration: Duration(seconds: int.parse(kSize2.round().toString())),
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