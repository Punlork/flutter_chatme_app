import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/onboarding/onborading_screen.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});
  static const String routePath = '/';
  static const String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        milliseconds: 1000,
      ),
      () => GoRouter.of(context).goNamed(OnboradingScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF5FEF8),
              Color(0xffF8FFFA),
              Color(0xffFFFFFF),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/Logo.png',
          ),
        ),
      ),
    );
  }
}
