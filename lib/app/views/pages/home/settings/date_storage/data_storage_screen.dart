import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/manage_storage/manage_storage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/models/data_storage_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class DataStorageScreen extends StatelessWidget {
  DataStorageScreen({Key? key}) : super(key: key) {
    _dataStorage = [
      DataStorageModel(title: 'Photos', subtitle: 'Off'),
      DataStorageModel(title: 'Audio', subtitle: 'Wi-Fi'),
      DataStorageModel(title: 'Documents', subtitle: 'Wi-Fi and Cellular'),
      DataStorageModel(title: 'Videos', subtitle: 'Off'),
    ];
  }

  static const String routePath = '/data_storage_screen';
  static const String routeName = 'data_storage_screen';

  late final List<DataStorageModel> _dataStorage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Data and Storage',
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppData.appPadding,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(ManageStorageScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Manage Storage',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: AppColors.nuetral[300],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'AUTO DOWNLOAD',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.nuetral[300],
                  ),
                ),
                const SizedBox(height: 20),
                ...List.generate(_dataStorage.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _dataStorage[index].title,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Row(
                              children: [
                                Text(
                                  _dataStorage[index].subtitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.nuetral[300],
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: AppColors.nuetral[300],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
