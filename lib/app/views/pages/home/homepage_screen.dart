import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_appbar.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_floating_button.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_nav_bar.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  static const String routePath = '/homepage_screen';
  static const String routeName = 'homepage_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: const CustomHomeScreenAppBar(),
      ),
      floatingActionButton: const CustomHomeScreenFloatingButton(),
      bottomNavigationBar: const ButtomNavBar(),
    );
  }
}
