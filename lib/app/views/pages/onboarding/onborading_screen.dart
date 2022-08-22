import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/add_phone_number/add_phone_number.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  static const String routePath = '/onboarding_1_screen';
  static const String routeName = 'onboarding_1_screen';

  @override
  State<OnboradingScreen> createState() => _Onborading1ScreenState();
}

class _Onborading1ScreenState extends State<OnboradingScreen> {
  final _onBoarding = [
    Image.asset(
      'assets/images/Illustration Onboarding.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Illustration Onboarding (1).png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Illustration Phone.png',
      fit: BoxFit.cover,
    ),
  ];

  late int _currentImage;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentImage = 0;
    _pageController = PageController(initialPage: _currentImage);
    _timer = Timer.periodic(
      const Duration(milliseconds: 2000),
      (timer) {
        if (_currentImage < 2) {
          _currentImage++;
        } else {
          _currentImage = 0;
        }
        _pageController.animateToPage(
          _currentImage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppData.appPadding,
          vertical: 25,
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/Logo (1).png'),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return _onBoarding[index];
                },
                itemCount: _onBoarding.length,
                controller: _pageController,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Stay connected with your',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Text(
              'friends and family',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'ChatMe is messaging app that will help you to ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Text(
              'connect with everyone.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Get Started',
              onPressed: () {
                GoRouter.of(context).goNamed(AddPhoneNumber.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
