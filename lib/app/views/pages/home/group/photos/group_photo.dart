import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_typing_screen.dart';

class GroupPhoto extends StatelessWidget {
  const GroupPhoto({Key? key}) : super(key: key);

  static const String routePath = '/group_photo';
  static const String routeName = 'group_photo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomNewChatHeader(name: 'Photo', subtitle: ''),
        ],
      ),
    );
  }
}
