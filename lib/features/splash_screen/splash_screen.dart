import 'dart:async';
import 'package:bank_app/common/colors.dart';
import 'package:bank_app/features/authentication_screen/view/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animations/animations.dart';



class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 1000),
        vsync: this)
      ..addStatusListener((status) {
        setState(() {});
      });

    Future.delayed(Duration(seconds: 2), () {
      _controller.forward().then((value) {
        context.go(AuthenticationScreen.routeName);
      });
    }, );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeScaleTransition(
                    animation: _controller, child: child);
              },
              child: Container(
                height: 100.h,
                width: 100.w,
                color: myRed,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 25.h,
                width: 25.h,
                child: Image.asset('images/bankLogo.png'),
              ),
            )
          ]

        ),
      ),
    );
  }
}