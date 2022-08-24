import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  static const String routePath = '/appearance_screen';
  static const String routeName = 'appearance_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
