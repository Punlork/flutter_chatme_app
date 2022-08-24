import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/last_seen/models/last_seen_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class LastSeenScreen extends StatelessWidget {
  LastSeenScreen({Key? key}) : super(key: key) {
    _lastSeenModel = [
      LastSeenModel(title: 'Everyone'),
      LastSeenModel(title: 'My Contact'),
      LastSeenModel(title: 'Nobody'),
    ];
  }

  static const String routePath = '/last_seen_screen';
  static const String routeName = 'last_seen_screen';

  late final List<LastSeenModel> _lastSeenModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Last Seen',
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppData.appPadding, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...List.generate(
                  _lastSeenModel.length,
                  (index) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          value: true,
                          onChanged: (value) {},
                          checkboxShape: CircleBorder(),
                          title: Text(_lastSeenModel[index].title),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Users who have your number saved in their contacts will also',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.nuetral[300],
                  ),
                ),
                Text(
                  'see it.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.nuetral[300],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
