import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String routePath = '/setting_screen';
  static const String routeName = 'setting_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppData.appPadding,
          vertical: 40,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline1,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color: AppColors.primary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
