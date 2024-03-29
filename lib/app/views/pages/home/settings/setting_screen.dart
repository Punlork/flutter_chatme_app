import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/appearance/appearance_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/data_storage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/edit_profile/edit_profile_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/faq/faq_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/last_call/last_call_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/models/setting_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/privacy_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/qr_code/qr_code_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/star_message/star_message_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key}) {
    _upperSettings = [
      SettingModel(
        name: 'Star messages',
        icon: Icons.star,
        routeName: StarMessageScreen.routeName,
      ),
      SettingModel(
        name: 'Last call',
        icon: Icons.phone,
        routeName: LastCallScreen.routeName,
      ),
      SettingModel(
        name: 'My folder',
        icon: Icons.people_alt,
      ),
      SettingModel(
        name: 'Appearance',
        icon: Icons.face_unlock_outlined,
        routeName: AppearanceScreen.routeName,
      ),
      SettingModel(name: 'Notification', icon: Icons.notifications),
    ];
    _lowerSettings = [
      SettingModel(
        name: 'Privacy',
        icon: Icons.lock,
        routeName: PrivacyScreen.routeName,
      ),
      SettingModel(
        name: 'Data storage',
        icon: Icons.storage,
        routeName: DataStorageScreen.routeName,
      ),
      SettingModel(
        name: 'FAQ',
        icon: Icons.question_mark,
        routeName: FAQScreen.routeName,
      ),
      SettingModel(name: 'Logout', icon: Icons.logout),
    ];
  }

  static const String routePath = '/setting_screen';
  static const String routeName = 'setting_screen';

  late final List<SettingModel> _upperSettings;
  late final List<SettingModel> _lowerSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppData.appPadding,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline1,
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(EditProfileScreen.routeName);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/Ellipse 18.png'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Roberto William',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.nuetral[900],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '+61-827-680-673',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.nuetral[300],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(QrCodeScreen.routeName);
                  },
                  icon: Icon(
                    Icons.qr_code,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
              ],
            ),
            SettingComponents(upperSettings: _upperSettings),
            SettingComponents(upperSettings: _lowerSettings),
            const SizedBox(height: 30),
            Text(
              '2021 ChatMe • Ver 1.0',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingComponents extends StatelessWidget {
  const SettingComponents({
    Key? key,
    required List<SettingModel> upperSettings,
  })  : _settings = upperSettings,
        super(key: key);

  final List<SettingModel> _settings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        const SizedBox(height: 10),
        ...List.generate(
          _settings.length,
          (index) => GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(_settings[index].routeName ?? '');
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary[50],
                    ),
                    child: Icon(
                      _settings[index].icon,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _settings[index].name,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: AppColors.divider,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
