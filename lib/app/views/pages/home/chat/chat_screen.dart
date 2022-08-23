import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/chat/models/chat_models.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_appbar.dart';
import 'package:flutter_chatme_app/app/views/pages/home/widgets/custom_floating_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key}) {
    _users = [
      ChatModel(
        name: 'Darrell Steward',
        chat: 'Good morning✨',
        time: '11:47 PM',
        notSeen: '4',
      ),
      ChatModel(
        name: 'Jane Cooper',
        chat: 'Can you sent the photo? ',
        time: '11:23 PM',
        isSender: 'You:',
      ),
      ChatModel(
        name: 'Theresa Webb',
        chat: 'Okay, Thank you',
        time: '11:17 PM',
        notSeen: '4',
      ),
      ChatModel(
        name: 'Work Team',
        chat: "Wait, i'am on my way!",
        time: '08:26 PM',
        isGroup: Icons.people_alt,
      ),
      ChatModel(
        name: 'Annette Black',
        chat: "Okay Rin, sounds good. Let's ...",
        time: '08:13 PM',
        isSender: 'You: ',
      ),
      ChatModel(
        name: 'Ronald Richards',
        chat: "Wait, i'am on my way!",
        time: 'Yesteday',
        isMusted: Icons.volume_off,
      ),
      ChatModel(
        name: 'Ronald Richards',
        chat: "Wait, i'am on my way!",
        time: 'Yesteday',
        isMusted: Icons.volume_off,
      ),
    ];
  }

  late final List<ChatModel> _users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: const CustomHomeScreenAppBar(),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = _users[index];
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              extentRatio: 0.5,
              motion: const ScrollMotion(),
              children: [
                const SizedBox(width: 20),
                StartActionSlider(
                  color: AppColors.warning,
                  title: 'Mute',
                  icon: Icons.volume_off,
                ),
                const SizedBox(width: 10),
                StartActionSlider(
                  color: AppColors.nuetral[100]!,
                  title: 'Pin',
                  icon: Icons.push_pin,
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.7,
              motion: ScrollMotion(),
              children: [
                const SizedBox(width: 10),
                StartActionSlider(
                  color: AppColors.danger,
                  title: 'Delete',
                  icon: Icons.delete,
                ),
                const SizedBox(width: 10),
                StartActionSlider(
                  color: AppColors.nuetral[100]!,
                  title: 'Archived',
                  icon: Icons.delete,
                ),
                const SizedBox(width: 10),
                StartActionSlider(
                  color: AppColors.nuetral[50]!,
                  title: 'More',
                  icon: Icons.more_horiz,
                ),
                const SizedBox(width: 10),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                user.isGroup != null
                                    ? Icon(
                                        user.isGroup,
                                        color: AppColors.primary,
                                      )
                                    : SizedBox(),
                                SizedBox(width: user.isGroup != null ? 5 : 0),
                                Text(user.name),
                                const SizedBox(width: 5),
                                user.isMusted != null
                                    ? Icon(
                                        user.isMusted,
                                        color: AppColors.nuetral[300],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            Text(user.time),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                user.isSender != null
                                    ? Text(user.isSender!)
                                    : SizedBox(),
                                Text(
                                  ' ${user.chat}',
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            user.notSeen != null
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Text(
                                      user.notSeen ?? '',
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    )),
                                  )
                                : SizedBox(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _users.length,
      ),
      floatingActionButton: CustomHomeScreenFloatingButton(),
    );
  }
}

class StartActionSlider extends StatelessWidget {
  const StartActionSlider({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      flex: 1,
      borderRadius: BorderRadius.circular(12),
      onPressed: (context) {},
      backgroundColor: color,
      foregroundColor: Colors.white,
      icon: icon,
      label: title,
    );
  }
}
