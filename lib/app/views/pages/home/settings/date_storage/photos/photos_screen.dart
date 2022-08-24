import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  static const String routePath = '/photos_screen';
  static const String routeName = 'photos_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Photos',
          ),
          const SizedBox(height: 20),
          CheckBosOptions(title: 'Off'),
          CheckBosOptions(title: 'Wi-Fi'),
          CheckBosOptions(title: 'Wifi and Cellcular'),
        ],
      ),
    );
  }
}

class CheckBosOptions extends StatelessWidget {
  const CheckBosOptions({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text(title),
            checkboxShape: CircleBorder(),
          ),
          Divider(),
        ],
      ),
    );
  }
}
