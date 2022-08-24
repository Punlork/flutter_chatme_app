import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/manage_storage/models/manage_storage_model.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class ManageStorageScreen extends StatelessWidget {
  ManageStorageScreen({Key? key}) : super(key: key) {
    _manageStorage = [
      ManageStorageModel(name: 'Esther Howard', freeSpace: '120,3 MB'),
      ManageStorageModel(name: 'Guy Hawkins', freeSpace: '431,6 MB'),
      ManageStorageModel(name: 'Robert Fox', freeSpace: '183,11 MB'),
      ManageStorageModel(name: 'Jacob Jones ', freeSpace: '623,3 MB'),
      ManageStorageModel(name: 'Floyd Miles', freeSpace: '325,67 MB'),
      ManageStorageModel(name: 'Dianne Russell', freeSpace: '123,3 MB'),
    ];
  }

  static const String routePath = '/manage_storage_screen';
  static const String routeName = 'manage_storage_screen';

  late final List<ManageStorageModel> _manageStorage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Manage Storage',
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: AppData.appPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Storage'),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.divider,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Storage(
                  title: 'Media and Files',
                  color: AppColors.primary,
                  capacity: '2,1GB',
                ),
                const SizedBox(height: 10),
                Storage(
                  title: 'Free',
                  color: AppColors.divider,
                  capacity: '62,5GB',
                ),
                Divider(),
                const SizedBox(height: 10),
                Text(
                  'Clear Cache',
                  style: TextStyle(
                    color: AppColors.primary[400],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Chat',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 20),
                ...List.generate(
                  _manageStorage.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary[400],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_manageStorage[index].name),
                                  const SizedBox(height: 5),
                                  Text(_manageStorage[index].phoneNumber),
                                ],
                              ),
                            ],
                          ),
                          Text(_manageStorage[index].freeSpace),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Storage extends StatelessWidget {
  const Storage({
    Key? key,
    required this.title,
    required this.color,
    required this.capacity,
  }) : super(key: key);

  final String title;
  final Color color;
  final String capacity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 10),
        Text(title),
        const SizedBox(width: 10),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        Text(capacity)
      ],
    );
  }
}
