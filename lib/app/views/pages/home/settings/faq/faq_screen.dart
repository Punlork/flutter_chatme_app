import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_contact/new_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/faq/models/faq_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({Key? key}) : super(key: key) {
    _faq = [
      FAQModel(
          name: 'How can i use this app?',
          description:
              'You can download it in the play store/app store, then type in the search menu with the name "ChatMe" then press download to be able to communicate easily.'),
      FAQModel(name: 'Is this app paid?'),
      FAQModel(name: 'How to send messages and videos?'),
      FAQModel(
          name:
              'Are there any special requirements for using this application?'),
      FAQModel(name: 'How to send files?'),
    ];
  }

  static const String routePath = '/faq_screen';
  static const String routeName = 'faq_screen';

  late final List<FAQModel> _faq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: [
              HeaderSettingScreens(
                title: 'FAQ',
                height: MediaQuery.of(context).size.height * 0.25,
                textField: CustomNewContactTextField(
                  hintText: 'Search questions...',
                  iconData: Icons.search,
                ),
              ),
              ...List.generate(
                _faq.length,
                (index) {
                  return ExpansionTile(
                    trailing: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(
                      _faq[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.nuetral[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppData.appPadding,
                          vertical: 10,
                        ),
                        child: Text(
                          _faq[index].description ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.nuetral[300],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
