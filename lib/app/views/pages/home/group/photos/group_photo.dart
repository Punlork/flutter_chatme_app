import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatme_app/app/logic/cubit/button_index_cubit.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/photos/models/buttons_photo_model.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/star_message/models/star_message_model.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/star_message/star_message_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/widgets/header_setting_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class GroupPhotoScreen extends StatelessWidget {
  GroupPhotoScreen({Key? key}) : super(key: key) {
    _buttons = [
      ButtonsPhotoModel(name: 'Photo'),
      ButtonsPhotoModel(name: 'Star'),
      ButtonsPhotoModel(name: 'Links'),
    ];

    _pages = [
      PhotoPage(),
      StarMessagePage(),
      LinkPage(),
    ];
  }

  static const String routePath = '/group_photo';
  static const String routeName = 'group_photo';

  late final List<ButtonsPhotoModel> _buttons;
  late final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderSettingScreens(
              title: 'Photos',
            ),
            BlocBuilder<ButtonIndexCubit, ButtonIndexState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 05,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppData.appPadding,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.divider,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              ...List.generate(
                                _buttons.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<ButtonIndexCubit>(context)
                                          .getIndex(index);
                                    },
                                    child: CustomPhotoButtons(
                                      condition: state.buttonIndex == index,
                                      buttons: _buttons[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _pages[state.buttonIndex],
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class LinkPage extends StatelessWidget {
  const LinkPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Text('Today'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'Invester - Landing Page',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'Google Meet',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Yesterday'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'Remote Work - Illustration',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'Invester - Mobile App  ',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'GWeblitics - Landing Page',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('26 Oct  2021'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'GWeblitics - Landing Page',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
              TodayComponents(
                name: 'GWeblitics - Landing Page',
                link: 'https://dribbble.com/shots/16979429-Invester-Landi...',
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

class TodayComponents extends StatelessWidget {
  const TodayComponents({
    Key? key,
    required this.name,
    required this.link,
  }) : super(key: key);

  final String name;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 50,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name),
              const SizedBox(height: 5),
              Text(
                link,
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StarMessagePage extends StatelessWidget {
  StarMessagePage({Key? key}) : super(key: key) {
    _starMessage = [
      StarMessageModel(
        name: 'Bianne Russell',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '21/07/2021',
        time: '15:46',
      ),
      StarMessageModel(
        name: 'Annie Miles',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '22/07/2021',
        time: '19:40',
      ),
      StarMessageModel(
        name: 'Bianne Russell',
        message: 'Egestas interdum orci commodo faucibus pretium, neque etiam',
        date: '21/07/2021',
        time: '18:23',
      ),
      StarMessageModel(
        name: 'Annie Miles',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '21/07/2021',
        time: '19:40',
      ),
    ];
  }

  late final List<StarMessageModel> _starMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...List.generate(
          _starMessage.length,
          (index) {
            return CustomStarMessage(
              starMessage: _starMessage[index],
            );
          },
        ),
      ],
    );
  }
}

class PhotoPage extends StatelessWidget {
  const PhotoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primary,
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(child: Picture()),
              Flexible(child: Picture()),
              Flexible(child: Picture()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 100,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.primary,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Picture(),
                  Picture(),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(child: Picture()),
              Flexible(child: Picture()),
              Flexible(child: Picture()),
            ],
          ),
        ],
      ),
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 50,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
    );
  }
}

class CustomPhotoButtons extends StatelessWidget {
  CustomPhotoButtons({
    Key? key,
    required this.buttons,
    required this.condition,
  }) : super(key: key);

  final ButtonsPhotoModel buttons;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 10,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: condition ? AppColors.white : Colors.transparent,
      ),
      child: Text(buttons.name),
    );
  }
}
