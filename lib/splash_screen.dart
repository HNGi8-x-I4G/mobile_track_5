import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_user_input/app.dart';

final zuriLogo = 'assets/images/zuri.jpg';

final hngLogo = 'assets/images/hng.jpg';

final i4gLogo = 'assets/images/i4g.jpg';

/// SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  ));

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _offsetAnimation,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(zuriLogo),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(hngLogo),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(i4gLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
