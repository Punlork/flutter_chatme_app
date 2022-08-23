import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatme_app/app/logic/cubit/index_page_cubit.dart';
import 'package:flutter_chatme_app/app/views/pages/home/call/call_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/chat/chat_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/setting_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_nav_bar.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key}) {
    _pages = [
      const CallScreen(),
      ChatScreen(),
      SettingScreen(),
    ];
  }

  static const String routePath = '/homepage_screen';
  static const String routeName = 'homepage_screen';

  late final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexPageCubit, IndexPageState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentIndex],
          bottomNavigationBar: ButtomNavBar(),
        );
      },
    );
  }
}
