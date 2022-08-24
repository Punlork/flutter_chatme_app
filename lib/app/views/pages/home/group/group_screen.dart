import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/deail_group/detail_group_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_typing_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  static const String routePath = '/group_screen';
  static const String routeName = 'group_screen';

  @override
  Widget build(BuildContext context) {
    void showCustomDialog(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: 'Barrier',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(AppData.appPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/Group 1073.png'),
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.photo_size_select_actual_rounded,
                    title: 'Photo or Gallary',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.document_scanner_outlined,
                    title: 'Document',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.location_on,
                    title: 'Location',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.person_pin,
                    title: 'Contact',
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primary[50],
      body: Column(
        children: <Widget>[
          CustomNewChatHeader(
            name: 'Work Team',
            subtitle: 'Annete, Lane and 26+',
            icon: Icons.people,
            onPressed: () {
              GoRouter.of(context).pushNamed(DetailGroupScreen.routeName);
            },
          ),
          Chat(
            message1: 'Hello, Good morning✨',
            message2:
                'Habitant elit pellentesque curabitur morbi sit fusce elit',
            time1: '18:23',
            time2: '18:25',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('19:40'),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: AppColors.primary,
                ),
                child: Text('Gravida lectus semper orci'),
              ),
            ],
          ),
          Chat(
            message1:
                'Egestas interdum orci commodo faucibus pretium, neque etiam',
            message2: 'Orci maecenas hendrerit mattis consectetur. Mauris.  ',
            time1: '19:40',
            time2: '19:40',
          ),
        ],
      ),
      bottomSheet: ColoredBox(
        color: AppColors.primary[50]!,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.symmetric(
            horizontal: AppData.appPadding,
            vertical: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: AppData.appPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              icon: IconButton(
                icon: const Icon(Icons.add_link),
                onPressed: () {
                  showCustomDialog(context);
                },
              ),
              suffixIcon: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.send,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.message1,
    required this.message2,
    required this.time1,
    required this.time2,
  }) : super(key: key);

  final String message1;
  final String message2;
  final String time1;
  final String time2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                padding: EdgeInsets.symmetric(
                  horizontal: AppData.appPadding,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message1,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppData.appPadding),
              child: Text(time1),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: AppData.appPadding,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
              ),
              child: Text(time2),
            ),
          ],
        ),
      ],
    );
  }
}
