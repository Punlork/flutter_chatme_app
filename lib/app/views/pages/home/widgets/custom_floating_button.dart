import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeScreenFloatingButton extends StatelessWidget {
  const CustomHomeScreenFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showNewChatFlow(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: 'Barrier',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: const Center(
              child: Text('Hello'),
            ),
          );
        },
      );
    }

    void showCustomDialog(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: 'Barrier',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomHomeScreenOptions(
                title: 'New Chat',
                iconPath: 'assets/icons/Solid/chat.svg',
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierLabel: 'Barrier',
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: const Center(
                          child: Text('Hello'),
                        ),
                      );
                    },
                  );
                },
              ),
              CustomHomeScreenOptions(
                title: 'New Contact',
                iconPath: 'assets/icons/Solid/user-circle.svg',
                onPressed: () {},
              ),
              CustomHomeScreenOptions(
                title: 'New Group',
                iconPath: 'assets/icons/Solid/user-group.svg',
                onPressed: () {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: () {
        showCustomDialog(context);
      },
      elevation: 0,
      child: SvgPicture.asset(
        'assets/icons/Solid/plus.svg',
      ),
    );
  }
}

class CustomHomeScreenOptions extends StatelessWidget {
  const CustomHomeScreenOptions({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });

  final String title;
  final String iconPath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 180,
        height: 56,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(iconPath),
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
