import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  static const String routePath = '/appearance_screen';
  static const String routeName = 'appearance_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Appearances',
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: AppColors.primary[50],
            padding: EdgeInsets.symmetric(
              horizontal: AppData.appPadding,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Habitant elit pellentesque',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'curabitur morbi sit fusce elit',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '18:25',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.nuetral[300],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          '19:40',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.nuetral[300],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gravida lectus semper orci',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Select a Theme',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/theme-options.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                ThemeOptions(
                  title: 'Night Mode',
                  icon: Icons.nightlight,
                ),
                ThemeOptions(
                  title: 'Large Emoji',
                  icon: Icons.emoji_emotions,
                ),
                const SizedBox(height: 10),
                Text(
                  'App Icon',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/app-icons.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeOptions extends StatelessWidget {
  const ThemeOptions({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary[50],
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        Switch(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
