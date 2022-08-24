import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/models/privacy_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/blocked_contact/blocked_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/last_seen/last_seen_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({Key? key}) : super(key: key) {
    _models = [
      PrivacyModel(
        title: 'Last Seen',
        subTitle: 'Everyone',
        routeName: LastSeenScreen.routeName,
      ),
      PrivacyModel(title: 'Profile Photo', subTitle: 'My Contact'),
      PrivacyModel(
        title: 'About',
        subTitle: 'My Contact',
      ),
      PrivacyModel(title: 'Group', subTitle: 'Everyone'),
      PrivacyModel(
        title: 'Blocked Contact',
        subTitle: '4 Contacts',
        routeName: BlockedContactScreen.routeName,
      ),
      PrivacyModel(title: 'Face ID'),
    ];
  }

  static const String routePath = '/privacy_screen';
  static const String routeName = 'privacy_screen';

  late final List<PrivacyModel> _models;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Privacy',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppData.appPadding,
              vertical: 20,
            ),
            child: PrivacyComponents(models: _models),
          ),
        ],
      ),
    );
  }
}

class PrivacyComponents extends StatelessWidget {
  const PrivacyComponents({
    Key? key,
    required List<PrivacyModel> models,
  })  : _models = models,
        super(key: key);

  final List<PrivacyModel> _models;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...List.generate(
          _models.length,
          (index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(_models[index].routeName ?? '');
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _models[index].title,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Row(
                          children: [
                            Text(
                              _models[index].subTitle ?? '',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.navigate_next,
                              color: AppColors.nuetral[300],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
        Text(
          'With face ID, you can secure your apps',
          style: TextStyle(
            color: AppColors.nuetral[300],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
