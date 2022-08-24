import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/blocked_contact/models/blocked_model.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class BlockedContactScreen extends StatelessWidget {
  BlockedContactScreen({Key? key}) : super(key: key) {
    _blocked = [
      BlockedModel(name: 'Annette Black'),
      BlockedModel(name: 'Arlene McCoy'),
      BlockedModel(name: 'Annie Miles'),
    ];
  }

  static const String routePath = '/blocked_contact_screen';
  static const String routeName = 'blocked_contact_screen';

  late final List<BlockedModel> _blocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSettingScreens(
            title: 'Blocked Contact',
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...List.generate(
                  _blocked.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_blocked[index].name),
                                  const SizedBox(height: 5),
                                  Text(_blocked[index].phoneNumber),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: AppColors.nuetral[300],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Blocked contacts can\'t send messages and call you.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.nuetral[300],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
