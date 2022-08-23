import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/call/call_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/chat/chat_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/setting_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_floating_button.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_nav_bar.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key}) {
    _pages = [
      const CallScreen(),
      ChatScreen(),
      const SettingScreen(),
    ];
    _currentIndex = 2;
  }

  static const String routePath = '/homepage_screen';
  static const String routeName = 'homepage_screen';

  late final List<Widget> _pages;
  late final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
   
      bottomNavigationBar: ButtomNavBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}
